
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:project/Models/location.dart';

class GetLocation {
  Location _location = Location();
  String? error;

  static GetLocation? _instance;
  static GetLocation getInstance() => _instance ??= GetLocation();

  Future<ThisDeviceLocation> getLocation() async {
    LocationData? location;

    try {
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission Denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission Denied Never Ask';
      }
      location = null;
    }
    return ThisDeviceLocation.locationItems(location);
  }
}