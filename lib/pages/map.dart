import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Models/cafe_data_list.dart';
import 'package:project/Models/location.dart';
import 'package:project/content/cafe_card.dart';
import 'package:project/helpers/find_cafe.dart';
import 'package:project/helpers/get_location.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
 GoogleMapController? mapController;
  ThisDeviceLocation? _myLocationData;
  CafeDataList? _shops;
  String? _shopName;
  String? _shopImage;

  List<Marker> allMarkers = [];

  Future<CafeDataList> _getCoffeeShops() async {
    final shopsApi = GetCafe.getInstance();
    // print("Shop");
    // print(_shopImage);
    
    return await shopsApi.getCafe(_myLocationData!);
  }

  Future<ThisDeviceLocation> _getLocation() async {
    final locationApi = GetLocation.getInstance();
    return await locationApi.getLocation();
  }

  void _addMarkers(CafeDataList places) {
    places.cafeList!.forEach((shop) {
      print(shop.name);
      allMarkers.add(Marker(
        markerId: MarkerId('cafe-'+shop.name),
        draggable: false,
        position: LatLng(shop.lat, shop.lon),
        infoWindow: InfoWindow(title: shop.name, snippet: ''),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _getLocation().then((location) {
      setState(() {
        _myLocationData = location;
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    _shops = await _getCoffeeShops();

    setState(() {
      mapController = controller;
      _addMarkers(_shops!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Shops"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: _myLocationData != null
                ? SizedBox(
                    child: GoogleMap(
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              _myLocationData!.lat, _myLocationData!.long),
                          zoom: 12.0),
                      onMapCreated: _onMapCreated,
                      markers: Set.from(allMarkers),
                    ),
                  )
                : const CircularProgressIndicator(
                    strokeWidth: 4.0,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
          ),
          //  Align(
          //   child: CoffeeCard(
          //     shopImage: "_shopImage",
          //     shopName: "_shopName",
          //   ),
          //   alignment: Alignment.bottomCenter,
          // )
        ],
      ),
    );
  }
  }
