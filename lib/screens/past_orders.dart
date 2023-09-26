import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/data/all_products_data.dart';
import 'past_orders/custom_order_card.dart';

class PastOrders extends StatelessWidget {
  const PastOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Past orders',style: TextStyle(
          color: Colors.black
        ),),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
        )
      ),
      body: ListView.builder(
          itemCount: orders.length,
          itemBuilder:(context,index){
            return CustomOrderCard(order: orders[index]);
      }),
    );
  }
}


