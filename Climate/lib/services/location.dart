import 'dart:core';

import 'package:geolocator/geolocator.dart';

class Location {
  double _longitude;

  double _latitude;

  double get latitude => _latitude;

  double get longitude => _longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {}
  }
}
