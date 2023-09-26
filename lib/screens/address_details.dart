import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/address_details/custom_text_field.dart';
import '../colors.dart';
import 'address_locating_on_map.dart';

class AddressDetails extends StatefulWidget {
  final LatLng position;
  const AddressDetails({Key? key,required this.position}) : super(key: key);

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  int? chosenPage;

  GlobalKey<FormState>? formKey;

  TextEditingController? areaController;
  TextEditingController? cityController;
  TextEditingController? streetController;
  TextEditingController? apartmentNumController;
  TextEditingController? buildingNumController;
  TextEditingController? floorController;
  TextEditingController? additionalDirectionsController;
  TextEditingController? phoneController;
  TextEditingController? addressLabelController;

  String? area;
  String? city;
  String? street;
  String? buildingNum;
  String? phone;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chosenPage = 1;
    formKey = GlobalKey<FormState>();
    areaController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    apartmentNumController = TextEditingController();
    buildingNumController = TextEditingController();
    floorController = TextEditingController();
    additionalDirectionsController = TextEditingController();
    phoneController = TextEditingController();
    addressLabelController = TextEditingController();
    area = '';
    city = '';
    street = '';
    buildingNum= '';
    phone = '';

  }


  String? validator(value){
    if(value!.isEmpty){
      return 'This field can not be empty';
    }
    return null;
  }


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
        title: const Text('New address',
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
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.12,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3,
                child: Card(
                  elevation: 1,
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
                              target: widget.position,
                              zoom: 14.5,
                            ),
                            zoomControlsEnabled: false,
                            markers: {
                              Marker(
                                markerId: const MarkerId('position'),
                                position: widget.position,
                              ),
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on,color: zoneColor1,),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 5),
                          child: Text('$area, $city',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$buildingNum $street, $area',
                              style: const TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('mobile: $phone',
                                style: const TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, PageTransition(
                              child: const LocateAddress(),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            chosenPage = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: (chosenPage == 1)?zoneColor1:Colors.white,
                                width: 2,
                              )
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.apartment,color: (chosenPage == 1)?zoneColor1:Colors.black54,),
                              Text('Apartment',style: TextStyle(color: (chosenPage == 1)?zoneColor1:Colors.black54),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            chosenPage = 2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: (chosenPage == 2)?zoneColor1:Colors.white,
                                    width: 2,
                                  )
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home,color: (chosenPage == 2)?zoneColor1:Colors.black54,),
                              Text('House',style: TextStyle(color: (chosenPage == 2)?zoneColor1:Colors.black54),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: getCustomTextFieldAddress(
                              context: context,
                              textFieldType: 0,
                              labelText: '*City',
                              validator: validator,
                              onChanged: (val){
                                setState(() {
                                  city = val;
                                });
                              },
                              controller: cityController!
                          ),
                        ),
                        Expanded(
                          child: getCustomTextFieldAddress(
                              context: context,
                              textFieldType: 0,
                              labelText: '*Area',
                              validator: validator,
                              onChanged: (val){
                                setState(() {
                                  area = val;
                                });
                              },
                              controller: areaController!
                          ),
                        ),
                      ],
                    ),
                    getCustomTextFieldAddress(
                        context: context,
                        textFieldType: 2,
                        labelText: '*Building number/name',
                        validator: validator,
                        onChanged: (val){
                          setState(() {
                            buildingNum = val;
                          });
                        },
                        controller: buildingNumController!
                    ),
                    Visibility(
                        visible: chosenPage == 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: getCustomTextFieldAddress(
                                  context: context,
                                  textFieldType: 1,
                                  labelText: '*Apartment num.',
                                  validator: validator,
                                  onChanged: (val){

                                  },
                                  controller: apartmentNumController!
                              ),
                            ),
                            Expanded(
                              child: getCustomTextFieldAddress(
                                  context: context,
                                  textFieldType: 1,
                                  labelText: 'Floor',
                                  validator: (value){return null;},
                                  onChanged: (val){

                                  },
                                  controller: floorController!
                              ),
                            ),
                          ],
                        ),
                    ),
                    getCustomTextFieldAddress(
                        context: context,
                        textFieldType: 2,
                        labelText: '*Street',
                        validator: validator,
                        onChanged: (val){
                          setState(() {
                            street = val;
                          });
                        },
                        controller: streetController!
                    ),
                    getCustomTextFieldAddress(
                        context: context,
                        textFieldType: 0,
                        labelText: 'Additional directions',
                        validator: (value){return null;},
                        onChanged: (val){

                        },
                        controller: additionalDirectionsController!
                    ),
                    getCustomTextFieldAddress(
                        context: context,
                        textFieldType: 1,
                        labelText: '*phone number',
                        validator: validator,
                        onChanged: (val){
                          setState(() {
                            phone = val;
                          });
                        },
                        controller: phoneController!
                    ),
                    getCustomTextFieldAddress(
                        context: context,
                        textFieldType: 0,
                        labelText: 'Address label',
                        validator: (value){return null;},
                        onChanged: (val){

                        },
                        controller: addressLabelController!
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Give your address a label such as home, work, etc.. so you can easily change addresses when needed',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),
              GestureDetector(
                onTap:(){
                  if(formKey!.currentState!.validate()){
                    Fluttertoast.showToast(
                        msg: 'Address saved successfully',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.07,
                  margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:zoneColor1
                  ),
                  child: const Center(
                    child: Text('Save address',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
