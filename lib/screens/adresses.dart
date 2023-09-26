import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/screens/address_locating_on_map.dart';

class Addresses extends StatefulWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('addresses',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
                onPressed: (){
                  Navigator.pushReplacement(context, PageTransition(
                    child: const LocateAddress(),
                    type: PageTransitionType.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                  ));
                },
                icon: Icon(Icons.add,color: zoneColor1,)
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                    itemBuilder: (context,index)=> getAddressElement(address: addresses[index],index: index),
                    separatorBuilder: (context,index)=> const SizedBox(height: 20,),
                    itemCount: addresses.length
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAddressElement({required Map<String,dynamic> address,required int index}){
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.3,
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                onPressed: (chosenIndex == index)?(){}: (){
                  setState(() {
                    chosenIndex = index;
                  });
                },
                child: Text((chosenIndex == index)?'Default':'Set default',
                  style: TextStyle(
                  color: (chosenIndex == index)?Colors.green:zoneColor1,
                  fontSize: 14,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}



