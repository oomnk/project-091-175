import 'package:location/location.dart';
import 'package:location/location.dart';

class ThisDeviceLocation{
    final lat, long;

    ThisDeviceLocation(this.lat, this.long);

    static ThisDeviceLocation locationItems(LocationData? location) {
    double? lat = location!.latitude;
    double? lon = location.longitude;

    
    return ThisDeviceLocation(lat, lon);
  }
}