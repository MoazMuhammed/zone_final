import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/single_product_one.dart';

import '../../colors.dart';
import '../../data/all_products_data.dart';

Widget getProducts({required int index,context}){
  List<Map<String,dynamic>> specialList = categoriesList[index]['products'];
  List<Widget> widgetsList = specialList.map((e){
    return elementProduct(context, e);
  }).toList();
  return Column(
    children: widgetsList,
  );
}

Widget elementProduct(context, Map<String,dynamic> product ){
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      GestureDetector(
        onTap: (){
          Navigator.push(context, PageTransition(
            child:SingleProductOne(product: product),
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 500),

          ));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: productElement2.withOpacity(0.1),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(40),
              topRight: const Radius.circular(40),
              bottomLeft: const Radius.circular(40),
              bottomRight: Radius.circular(
                MediaQuery.of(context).size.height*0.18
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
                      Container(
                          height: MediaQuery.of(context).size.height * 0.15,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          '${product['price']} LE',
                          textAlign: TextAlign.center,
                          style:
                          const TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {

                          },
                          icon: (product['favourite'])
                              ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                              : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
      Container(
        margin:  EdgeInsets.only(
          right: MediaQuery.of(context).size.height*0.03,
          bottom: MediaQuery.of(context).size.height*0.03
        ),
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height*0.03,
          backgroundColor: Colors.black,
          child: IconButton(
            onPressed: (){
              Navigator.push(context, PageTransition(
                child:SingleProductOne(product: product),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(milliseconds: 500),

              ));
            },
            icon: const Icon(Icons.arrow_forward,color: Colors.white,),
          ),
        ),
      ),
    ],
  );
}