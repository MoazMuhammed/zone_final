import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/screens/checkout/payment_method.dart';
import 'package:zone_final/screens/checkout/payment_summary.dart';
import 'package:zone_final/screens/checkout/promo_code_entry.dart';
import 'checkout/address_element.dart';
import 'checkout/estimated_time.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
        title: const Text('Checkout',
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
            const EstimatedTime(),
            const PromoCode(),
            const PaymentMethod(),
            const PaymentSummary(),
          ],
        ),
      ),
    );
  }


}


