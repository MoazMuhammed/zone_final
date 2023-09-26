import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../colors.dart';
import '../../data/all_products_data.dart';
import '../order_details.dart';

class CustomOrderCard extends StatelessWidget {
  final Map<String,dynamic> order;
  const CustomOrderCard({Key? key,required this.order}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> shops = order['shops'];
    List<Widget> stackChildren = shops.map((e){
      return Column(
        children: [
          SizedBox(
            height: ( 15 * shops.indexOf(e) ).toDouble(),
          ),
          Row(
            children: [
              SizedBox(
                width: ( 5 * shops.indexOf(e) ).toDouble(),
              ),
              CircleAvatar(
                backgroundImage:Image.asset(ads[shops.indexOf(e)%ads.length],fit: BoxFit.fill,).image ,
              ),
            ],
          ),
        ],
      );
    }).toList();
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0,left: 20),
                    child: Stack(
                      children: stackChildren,
                    ),
                  ),
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0,left: 12.0),
                        child: AutoSizeText(
                          (shops.length == 1)?shops[0]['name']:'Mixed order from ${shops.length} shops',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0,left: 12.0),
                        child: Text(
                          order['finished']?'Delivered':'Canceled',
                          style:  TextStyle(
                            color: order['finished']?Colors.green:Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0,left: 12.0),
                        child: Text(
                          'on: ${order['date_time']}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Order ID: ${order['id']}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, PageTransition(
                                child: const OrderDetails(),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                              ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.more,color: zoneColor1,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0,right: 8),
                                  child: Text(
                                    'view details',
                                    style: TextStyle(
                                      color: zoneColor1,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}
