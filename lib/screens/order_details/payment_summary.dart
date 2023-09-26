import 'package:flutter/material.dart';
import '../../data/all_products_data.dart';


class PaymentSummary extends StatelessWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for(int i=0;i<cartItems.length;i++){
      total = total + cartItems[i]['price']*cartItems[i]['amount'];
    }
    double delivery = total * 0.12;
    double taxes = total * 0.14;
    double service = total * 0.12;
    double net = total + delivery + taxes + service;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Check',
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
          ],
        ),
      ),

    );
  }
}
