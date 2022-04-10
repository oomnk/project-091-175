import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:project/Models/cafe.dart';
import 'package:project/Models/cafe_data_list.dart';
import 'package:project/Models/location.dart';
import 'package:project/content/cafe_card.dart';
import 'package:project/helpers/find_cafe.dart';
import 'package:project/helpers/get_location.dart';
import 'package:project/widgets/cafe_card.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController? mapController;
  ThisDeviceLocation? _myLocationData;
  CafeDataList? _shops;
  double _findRadius = 100;
  Set<Circle> circles = {
    Circle(
        circleId: CircleId("0"),
        radius: 0,
        center: LatLng(0, 0),
        strokeColor: Colors.brown,
        strokeWidth: 1,
        fillColor: const Color.fromARGB(0, 88, 41, 9).withOpacity(0.15))
  };
  List<Marker> allMarkers = [];

  Cafe _currentCafeSelect = Cafe("", "", 0, 0,"", 0);

  double pinPillPosition = -100;

  Future<CafeDataList> _getCoffeeShops() async {
    final shopsApi = GetCafe.getInstance();

    return await shopsApi.getCafe(_myLocationData!, _findRadius);
  }

  Future<ThisDeviceLocation> _getLocation() async {
    final locationApi = GetLocation.getInstance();
    return await locationApi.getLocation();
  }

  void _addMarkers(CafeDataList places) {

    places.cafeList!.forEach((shop) {
      allMarkers.add(Marker(
          markerId: MarkerId('cafe-' + shop.id),
          draggable: false,
          position: LatLng(shop.lat, shop.lon),
          onTap: () {
            setState(() {
              _currentCafeSelect = shop;
              pinPillPosition = 0;
            });
            print(_currentCafeSelect.photoRef);
          }));
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
        circles = {
          Circle(
              circleId: CircleId("0"),
              radius: 0,
              center: LatLng(_myLocationData!.lat, _myLocationData!.long),
              strokeColor: Colors.brown,
              strokeWidth: 1,
              fillColor: const Color.fromARGB(0, 88, 41, 9).withOpacity(0.15))
        };
    });
  }

  void putOnMap() async {
    allMarkers = [];
    circles = {
      Circle(
          circleId: CircleId("0"),
          radius: _findRadius + 500,
          center: LatLng(_myLocationData!.lat, _myLocationData!.long),
          strokeColor: Colors.brown,
          strokeWidth: 1,
          fillColor: Color.fromARGB(0, 88, 41, 9).withOpacity(0.15))
    };
    _shops = await _getCoffeeShops();
    setState(() {
      _addMarkers(_shops!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Shops"),
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
                          zoom: 14.0),
                      onMapCreated: _onMapCreated,
                      markers: Set.from(allMarkers),
                      circles: circles,
                      onTap: (LatLng location) {
                        setState(() {
                          pinPillPosition = -100;
                        });
                      },
                    ),
                  )
                : const CircularProgressIndicator(
                    strokeWidth: 4.0,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 30),
              child: Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.6,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("100 m"),
                      Flexible(
                        child: Slider(
                          inactiveColor: Colors.grey,
                          label: "Find Radius",
                          min: 100,
                          max: 5000,
                          divisions: 100,
                          value: _findRadius,
                          onChanged: (value) {
                            setState(() {
                              _findRadius = value;
                              print(_findRadius);
                            });
                          },
                          onChangeEnd: (value) {
                            putOnMap();
                          },
                        ),
                      ),
                      const Text("5 km"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CafeCard(pinPillPosition: pinPillPosition,currentCafeSelect: _currentCafeSelect,)
        ],
      ),
    );
  }
}
