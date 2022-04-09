
import 'package:project/Constants/config.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:project/Models/cafe_data_list.dart';
import 'package:project/Models/location.dart';

class GetCafe{
  static GetCafe? instance;
  static GetCafe getInstance() => instance ??= GetCafe();

  Future<CafeDataList> getCafe(ThisDeviceLocation location) async{  
    final googlePlaces = GoogleMapsPlaces(apiKey: apiKey);
    final respones = await googlePlaces.searchNearbyWithRadius(Location(lat: location.lat, lng: location.long), 2000, type: 'cafe', keyword: 'coffee');

    return CafeDataList.convertToShops(respones.results);
  }
}