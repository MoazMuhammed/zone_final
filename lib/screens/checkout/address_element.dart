import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../../colors.dart';
import '../adresses.dart';

Widget getAddressElement({required Map<String,dynamic> address,required context}){
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height*0.3,
    child: Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.13,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.zero,
                  top: Radius.circular(20)
              ),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: address['latLng'],
                  zoom: 14.5,
                ),
                zoomControlsEnabled: false,
                markers: {
                  Marker(
                    markerId: MarkerId(address['area']),
                    position: address['latLng'],
                  ),
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on,color: zoneColor1,),
            title: Padding(
              padding: const EdgeInsets.only(top: 12.0,bottom: 5),
              child: Text('${address['area']}, ${address['city']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${address['detailed']}',
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('mobile: ${address['mobile']}',
                    style: const TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
              ],
            ),
            trailing: TextButton(
              onPressed: (){
                Navigator.push(context, PageTransition(
                  child: const Addresses(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                ));
              },
              child: Text('Change',
                style: TextStyle(
                  color: zoneColor1,
                  fontSize: 14,
                ),),
            ),
          ),
        ],
      ),
    ),
  );
}
