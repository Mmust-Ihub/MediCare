import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    final Position position;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    return position;
  }
}


  
