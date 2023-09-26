import 'package:flutter/material.dart';
import 'package:zone_final/colors.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({Key? key}) : super(key: key);

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {

  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    codeController.text = '1235esvkn5';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('promo code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              child: TextField(
                style: const TextStyle(
                  color: Colors.grey
                ),
                enabled: false,
                controller: codeController,
                cursorColor: zoneColor1,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.check,color: Colors.green,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: zoneColor1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
