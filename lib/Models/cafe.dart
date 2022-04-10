import 'package:google_maps_webservice/places.dart';

class Cafe {
  final String id;
  final String name;
  final double lat;
  final double lon;
  final String photoRef;
  final num rating;

  Cafe(this.id, this.name, this.lat, this.lon, this.photoRef, this.rating);

  static shopDetails(PlacesSearchResult places) {
    String id = places.placeId;
    String name = places.name;
    double lat = places.geometry!.location.lat;
    double lon = places.geometry!.location.lng;
    num? rating = 0;

    String photoRef = "";
    if( places.photos.isNotEmpty){
      photoRef = places.photos[0].photoReference;
    }

    if(places.rating != null){
      rating = places.rating;
    }

  
    return Cafe(id, name, lat, lon, photoRef, rating!);
  }
}