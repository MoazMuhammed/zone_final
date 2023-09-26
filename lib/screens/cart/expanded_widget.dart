import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/checkout.dart';

import '../../colors.dart';
import '../../data/all_products_data.dart';

Widget expandedWidget(context,bool isMax) {
  double total = 0;
  for(int i=0;i<cartItems.length;i++){
    total = total + cartItems[i]['price']*cartItems[i]['amount'];
  }
  double delivery = total * 0.12;
  double taxes = total * 0.14;
  double service = total * 0.12;
  double net = total + delivery + taxes + service;

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          isMax?Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: 3,
            decoration: BoxDecoration(
              color: productElement2,
              borderRadius: BorderRadius.circular(10),
            ),
          ):
      Icon(Icons.keyboard_arrow_up, size: 30, color: productElement2),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Preview check',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Sub total',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${total.toStringAsFixed(2)} LE',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Delivery fees',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${delivery.toStringAsFixed(2)} LE',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Taxes',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${taxes.toStringAsFixed(2)} LE',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Service',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${service.toStringAsFixed(2)} LE',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Total',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${net.toStringAsFixed(2)} LE',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(
                child: const Checkout(),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(milliseconds: 500),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height*0.035
                ),
                color: zoneColor2,
              ),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
              margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
              child: const Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

