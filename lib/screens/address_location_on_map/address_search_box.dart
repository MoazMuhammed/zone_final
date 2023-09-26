import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:zone_final/screens/address_location_on_map/search_location.dart';
import '../../blocs/address/address_bloc.dart';
import '../../colors.dart';

class AddressSearchBox extends StatefulWidget {
  const AddressSearchBox({Key? key}) : super(key: key);

  @override
  State<AddressSearchBox> createState() => _AddressSearchBoxState();
}

class _AddressSearchBoxState extends State<AddressSearchBox> {
  TextEditingController searchController = TextEditingController();

  bool isChanged = false;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if(state is AddressChanged){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: productElement1,
            ),
            width: MediaQuery.of(context).size.width * 0.95,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  cursorColor: zoneColor1,
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.streetAddress,
                  onChanged: (val){
                    if(val.isNotEmpty){
                      setState(() {
                        isChanged = true;
                      });
                    }
                    else{
                      isChanged = false;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: (!isChanged)?const SizedBox():IconButton(onPressed: (){
                        setState(() {
                          searchController.clear();
                          isChanged = false;
                          BlocProvider.of<AddressBloc>(context).add(
                              AddressChangeEvent(lat: 30.0444, lng: 31.2357)
                          );
                        });
                      }, icon: const Icon(Icons.clear,color: Colors.black54,)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      hintText: 'Search address',
                      border: InputBorder.none)),
              suggestionsCallback: (text) async {
                return await searchLocation(context, text);
              },
              itemBuilder: (context, Prediction suggestion) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Icon(
                        Icons.location_on,
                        color: zoneColor1,
                      ),
                    ),
                    Expanded(
                        child: AutoSizeText(
                          suggestion.description!,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(fontSize: 14),
                        ))
                  ],
                );
              },
              onSuggestionSelected: (Prediction suggestion) async {
                await getLocationLatLng(suggestion.description!).then((value){
                  BlocProvider.of<AddressBloc>(context).add(
                      AddressChangeEvent(lat: value.first, lng: value.last)
                  );
                });
                setState(() {
                  searchController.text = suggestion.description!;
                });
              },
            ),
          );
        }else {
          return const SizedBox();
        }
      },
    );
  }
}
