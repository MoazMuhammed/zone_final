import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../colors.dart';
import '../../data/all_products_data.dart';
import '../single_product_two.dart';

Widget getProducts2({required int index,context}){
  List<Map<String,dynamic>> specialList = cakesList;
  List<Widget> widgetsList = specialList.map((e){
    return elementProduct2(context, e);
  }).toList();
  return Column(
    children: widgetsList,
  );
}

Widget elementProduct2(context, Map<String,dynamic> product ){
  return Stack(
    children: [
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            margin: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.13,
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
              flex: 5,
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            spreadRadius: -38,
                            blurRadius: 10,
                            offset: Offset(0, 48)),
                      ]),
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.fill,
                      )),
                ],
              )),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name'],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${product['price']} LE',
                      textAlign: TextAlign.start,
                      style:
                      const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ),
                ],
              )
          ),
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
                        child:SingleProductTwo(product: product),
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