

import 'package:google_maps_webservice/places.dart';
import 'package:project/Models/cafe.dart';

class CafeDataList {
    List<Cafe>? cafeList;

    CafeDataList(this.cafeList);

    static convertToShops(List<PlacesSearchResult> googlePlaces) {
    List<Cafe> shops = [];

    googlePlaces.forEach((shop) {
      shops.add(Cafe.shopDetails(shop));
    });
    return CafeDataList(shops);
  }
    
}