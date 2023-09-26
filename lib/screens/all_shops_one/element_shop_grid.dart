import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/all_products_one.dart';
import '../../colors.dart';
import '../../models/commercial_models.dart';

Widget getShopsGrid({required context,required List<Shop> shops}){
  List<Widget> widgetsList = shops.map((e){
    return elementShop1(context, e);
  }).toList();
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9
      ),
      children: widgetsList,
    ),
  );
}

Widget elementShop1(context, Shop shop ){
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      GestureDetector(
        onTap: (){
          Navigator.push(context, PageTransition(
            child: const AllProductsOne(),
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 500),

          ));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: productElement2.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40),
              topRight: const Radius.circular(40),
              bottomLeft: const Radius.circular(40),
              bottomRight: Radius.circular(
                  MediaQuery.of(context).size.height*0.12
              ),
            ),
          ),
          child: Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Image.network(
                            shop.logo!,
                            fit: BoxFit.fill,
                          )),
                      const Expanded(child: SizedBox()),
                    ],
                  )),
              const Expanded(flex: 1,child: SizedBox(),),
            ],
          ),
        ),
      ),
      Container(
        margin:  EdgeInsets.only(
            right: MediaQuery.of(context).size.height*0.02,
            bottom: MediaQuery.of(context).size.height*0.02
        ),
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height*0.025,
          backgroundColor: Colors.black,
          child: Center(
            child: IconButton(
              onPressed: (){
                Navigator.push(context, PageTransition(
                  child: const AllProductsOne(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                ));
              },
              icon: const Icon(Icons.arrow_forward,color: Colors.white,size: 20,),
            ),
          ),
        ),
      ),
    ],
  );
}