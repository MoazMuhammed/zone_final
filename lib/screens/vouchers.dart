import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/screens/vouchers/category_element.dart';
import 'package:zone_final/screens/vouchers/coupon.dart';
import '../data/all_products_data.dart';

class Vouchers extends StatefulWidget {
  const Vouchers({Key? key}) : super(key: key);

  @override
  State<Vouchers> createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  int chosenIndex = 0;

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
        title: const Text('Vouchers',
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            padding:
            const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vouchers.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            chosenIndex = index;
                          });
                        },
                        child: ElementVouchers(
                          categoryName: vouchers[index],
                          isChosen: chosenIndex == index,
                        ),
                      ))
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: vouchersDetails.where((element) => element['type']== chosenIndex).length,
                    itemBuilder: (context,index)=> Coupon(
                        colors: gradients[index%gradients.length],
                        voucher: vouchersDetails[index]
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}




