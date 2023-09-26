import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zone_final/colors.dart';

class TrackMap extends StatefulWidget {
  const TrackMap({Key? key}) : super(key: key);

  @override
  State<TrackMap> createState() => _TrackMapState();
}

class _TrackMapState extends State<TrackMap> {


  LatLng destination = const LatLng(30.0444, 31.2357);
  LatLng deliveryPosition = const LatLng(30.1, 31.2357);

  List<LatLng> polyLinesCoordinates=[];

  void getPolyLines() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        mapsApiKey,
        PointLatLng(deliveryPosition.latitude, deliveryPosition.longitude),
        PointLatLng(destination.latitude, destination.longitude),
    );
    if(result.points.isNotEmpty){
      polyLinesCoordinates = result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
    }
    setState(() {});
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPolyLines();
  }


  @override
  Widget build(BuildContext context) {

    
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('destination'),
        position: destination,
      ),
      Marker(
        markerId: const MarkerId('delivery position'),
        position: deliveryPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)
      ),
    };

    return GoogleMap(
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: deliveryPosition,
        zoom: 13,
      ),
      markers: markers,
      polylines: {
        Polyline(
          polylineId: const PolylineId('route'),
          width: 6,
          color: Colors.blue,
          points: polyLinesCoordinates
        ),
      },
    );
  }
}
