import 'package:flutter/material.dart';
import 'package:zone_final/colors.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  int paymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment method',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  groupValue: paymentMethod,
                  value: 1,
                  onChanged: (val){
                    setState(() {
                      paymentMethod = val!;
                    });
                  },
                  activeColor: zoneColor1,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.money,color: Colors.green,),
                ),
                const Text('cash on delivery',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                const Expanded(child: SizedBox(),),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: paymentMethod,
                  value: 2,
                  onChanged: (val){
                    setState(() {
                      paymentMethod = val!;
                    });
                  },
                  activeColor: zoneColor1,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.credit_card,color: Colors.blue,),
                ),
                const Text('visa or master card',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                const Expanded(child: SizedBox(),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
