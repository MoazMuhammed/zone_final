import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:zone_final/colors.dart';


Future<List<Prediction>> searchLocation(BuildContext context , String text) async {
  List<Prediction> predictionList = [];
  if(text.isNotEmpty){
    http.Response response = await getLocationData(text);
    var data = jsonDecode(response.body);
    if(data['status'] == 'OK'){
      data['predictions'].forEach(
          (prediction)=>predictionList.add(Prediction.fromJson(prediction))
      );
    }
    else{

    }
  }
  return predictionList;
}

Future<http.Response> getLocationData(String text) async {
  return await http.get(
    Uri.https(
      'maps.googleapis.com',
      'maps/api/place/autocomplete/json',
      {
        'input':text,
        'key':mapsApiKey,
      }
    ),
  );
}

Future<List<double>> getLocationLatLng(String address) async {
  List<Location> locations = await locationFromAddress(address);
  return [locations.last.latitude,locations.last.longitude];
}


