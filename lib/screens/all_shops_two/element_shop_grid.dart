import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../colors.dart';
import '../../models/commercial_models.dart';
import '../all_products_two.dart';

Widget getShopsGrid({required context,required List<Shop> shops}){
  List<Widget> widgetsList = shops.map((e){
    return elementShop2(context, e);
  }).toList();
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          childAspectRatio: 0.98
      ),
      children: widgetsList,
    ),
  );
}

Widget elementShop2(context, Shop shop ){
  return Stack(
    children: [
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              color: productElement2.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(flex: 1,child: SizedBox()),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            spreadRadius: -38,
                            blurRadius: 10,
                            offset: Offset(0, 48)),
                      ]),
                      child: Image.network(
                        shop.logo!,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      shop.name!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              )),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height*0.03,
                  backgroundColor: zoneColor1,
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                        child: const AllProductsTwo(),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      ));
                    },
                    icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

}