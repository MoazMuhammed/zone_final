import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/screens/vouchers.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({Key? key}) : super(key: key);

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {

  TextEditingController codeController = TextEditingController();

  bool isChanged = false;

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
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
              child: Text('Enter promo code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('If you have vouchers that can be applied enter the code here.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('If you do not know visit',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(
                      child: const Vouchers(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  child: Text('vouchers page',
                    style: TextStyle(
                      color: zoneColor1,
                      fontSize: 14,
                    ),
                  ),
                ),

              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('click on the voucher you choose and it will get copied then come back paste it here',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              child: TextField(
                controller: codeController,
                onChanged: (val){
                  setState(() {
                    if(val.isEmpty){
                      isFinished = false;
                      isChanged = false;
                    }else{
                      isFinished = false;
                      isChanged = true;
                    }
                  });
                },
                cursorColor: zoneColor1,
                decoration: InputDecoration(
                  suffixIcon: (!isFinished)?const SizedBox()
                  :const Icon(Icons.check,color: Colors.green,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: zoneColor1),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (isChanged)?(){
                setState(() {
                  isChanged = false;
                  isFinished = true;
                });
                Fluttertoast.showToast(
                    msg: 'Promo code valid',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }:(){},
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.07,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: (isChanged)?zoneColor1:Colors.grey
                ),
                child: const Center(
                  child: Text('Check promo code',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
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
