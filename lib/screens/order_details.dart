import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/screens/order_details/detailed_products.dart';

import '../data/all_products_data.dart';
import 'order_details/address_element.dart';
import 'order_details/payment_summary.dart';
import 'order_details/promo_code_entry.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

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
        title: const Text('Order details',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            getAddressElement(address: addresses[0],context: context),
            const DetailedProducts(),
            const PromoCode(),
            const PaymentSummary(),
          ],
        ),
      ),
    );
  }
}
