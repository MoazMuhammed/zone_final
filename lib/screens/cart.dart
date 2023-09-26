import 'package:flutter/material.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/screens/cart/preview_widget.dart';

import 'cart/background_widget.dart';
import 'cart/expanded_widget.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isMax = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: DraggableBottomSheet(
        minExtent: MediaQuery.of(context).size.height * 0.13,
        useSafeArea: false,
        curve: Curves.easeIn,
        previewWidget: previewWidget(context),
        expandedWidget: expandedWidget(context,isMax),
        backgroundWidget: backgroundWidget(context),
        maxExtent: MediaQuery.of(context).size.height * 0.5,
        onDragging: (pos) {
          if(pos > MediaQuery.of(context).size.height * 0.47){
            setState(() {
              isMax = true;
            });
          }
          else{
            setState(() {
              isMax = false;
            });
          }
        },
      ),
    );
  }







}
