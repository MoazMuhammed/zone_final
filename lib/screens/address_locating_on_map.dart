import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/address_details.dart';
import '../blocs/address/address_bloc.dart';
import '../colors.dart';
import 'address_location_on_map/address_search_box.dart';
import 'address_location_on_map/get_current_location.dart';

class LocateAddress extends StatefulWidget {
  const LocateAddress({Key? key}) : super(key: key);

  @override
  State<LocateAddress> createState() => _LocateAddressState();
}

class _LocateAddressState extends State<LocateAddress> {
  Set<Marker> markers = {};
  Completer<GoogleMapController> myController = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: productElement1,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Add address',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
          leading: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: productElement1,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: BlocConsumer<AddressBloc, AddressState>(
                      listener: (context, state) async {
                        if (state is AddressChanged) {
                          GoogleMapController controller =
                              await myController.future;
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                            target: LatLng(state.lat, state.lng),
                            zoom: 14,
                          )));
                          setState(() {
                            (state.lat == 30.0444 && state.lng == 31.2357)
                                ? {}
                                : markers = {
                                    Marker(
                                      markerId: const MarkerId('target'),
                                      position: LatLng(state.lat, state.lng),
                                    ),
                                  };
                          });
                        }
                      },
                      builder: (context, state) {
                        if (state is AddressChanged) {
                          return GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              myController.complete(controller);
                            },
                            zoomControlsEnabled: false,
                            onTap: (latLng) {
                              setState(() {
                                markers = {
                                  Marker(
                                    markerId: const MarkerId('target'),
                                    position: latLng,
                                  ),
                                };
                              });
                            },
                            initialCameraPosition: CameraPosition(
                              target: LatLng(state.lat, state.lng),
                              zoom: 14.5,
                            ),
                            markers: markers,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const AddressSearchBox(),
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        color: productElement1,
                      ),
                      child: const Text(
                        'Pick current location',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    BlocBuilder<AddressBloc, AddressState>(
                      builder: (context, state) {
                        if (state is AddressChanged) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                currentLocation(context);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: zoneColor2,
                                child: const Icon(
                                  Icons.my_location,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
                BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if(state is AddressChanged){
                      return GestureDetector(
                        onTap: (markers.isEmpty)
                            ? () {}
                            : () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                child: AddressDetails(
                                    position: LatLng(state.lat, state.lng)
                                ),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: (markers.isEmpty) ? Colors.grey : zoneColor2,
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.07,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 0),
                          child: const Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }else{
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void currentLocation(context) async {
    try {
      await getCurrentLocation().then((value) {
        BlocProvider.of<AddressBloc>(context)
            .add(AddressChangeEvent(lat: value.latitude, lng: value.longitude));
      });
    } catch (e) {
      return;
    }
  }
}
