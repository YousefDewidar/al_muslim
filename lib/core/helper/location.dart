import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  //?Ask user to give the application the location access
  Future<LocationPermission> requestPermission() async {
    LocationPermission permision = await Geolocator.requestPermission();
    return permision;
  }

//?make sure location is active ifNot send to setting to activate
  Future<void> enabelLocaion() async {
    bool isEnabel = await Geolocator.isLocationServiceEnabled();
    if (!isEnabel) {
      await Geolocator.openAppSettings();
    }
  }

  //?to get current location after checking of location is activate
  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool isEnabel = await Geolocator.isLocationServiceEnabled();
    if (isEnabel &&
        (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always)) {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
        ),
      );
      return position;
    } else {
      await enabelLocaion();
      return null;
    }
  }
}

//to get a certin Location like your countryName,etc...
class GetLocationData {
  getLocation({required Position? position}) async {
    final List<Placemark> placeMark = await placemarkFromCoordinates(
      position!.latitude,
      position.longitude,
    );
    log(placeMark[0].locality.toString());
  }
}
