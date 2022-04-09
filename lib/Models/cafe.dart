import 'package:google_maps_webservice/places.dart';

class Cafe {
  final String id;
  final String name;
  final double lat;
  final double lon;
  final String photoRef;

  Cafe(this.id, this.name, this.lat, this.lon, this.photoRef);

  static shopDetails(PlacesSearchResult places) {
    String id = places.placeId;
    String name = places.name;
    double lat = places.geometry!.location.lat;
    double lon = places.geometry!.location.lng;
    String photoRef = places.reference[0];
    
    // if(!places.photos.isEmpty){
    //   photoRef = places.photos[0];
    // }

    return Cafe(id, name, lat, lon, photoRef);
  }
}