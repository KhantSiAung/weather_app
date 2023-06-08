import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GetLocation {
  Location location = Location();
  double ? latitude ;
  double ? longtude ;
  Future checkLocation() async {
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }
    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
    var loc = await location.getLocation();
    latitude = loc.latitude ;
    longtude = loc.longitude;
    print("location service in lattitude $latitude");
    print("loaction service  in longtude $longtude");
    return ;
  }
}
