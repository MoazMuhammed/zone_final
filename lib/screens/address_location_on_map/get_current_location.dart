import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  bool serviceStatus = await Geolocator.isLocationServiceEnabled();
  if(!serviceStatus) {
    return Future.error('Location services are disabled');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission denied');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission denied forever');
    }
  }
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}



