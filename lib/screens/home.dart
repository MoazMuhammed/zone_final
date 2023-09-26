import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/data/products_handler.dart';
import 'package:zone_final/screens/all_categories.dart';
import 'package:zone_final/screens/home/ad_slider.dart';
import 'package:zone_final/screens/home/categories_view.dart';
import 'package:zone_final/screens/home/products_list.dart';
import '../colors.dart';
import 'cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                  width: MediaQuery.of(context).size.width* 0.15,
                  height: MediaQuery.of(context).size.height* 0.07,
                  decoration: BoxDecoration(
                    color: productElement1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.location_on,color: zoneColor2,)
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'send to:',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Badr city , Cairo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(
                      child: const Cart(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                    width: MediaQuery.of(context).size.width* 0.15,
                    height: MediaQuery.of(context).size.height* 0.07,
                    decoration: BoxDecoration(
                      color: productElement1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child:  Icon(Icons.shopping_cart,color: Colors.black,)
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: productElement1,
              ),
              width: MediaQuery.of(context).size.width*0.9,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
              child: TextFormField(
                cursorColor: zoneColor1,
                style: TextStyle(
                    color: zoneColor2
                ),
                decoration: const InputDecoration(
                    hintText: 'Search products ..',
                    border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                ),
              ),
            ),
            getSlider(context),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: getAllShopCategories(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  if(snapshot.data!.isNotEmpty){
                    return CategoriesView( categories: snapshot.data!);
                  }else {
                    return const SizedBox();
                  }
                }
                else {
                  return CircularProgressIndicator(
                    strokeWidth: 5,
                    color: zoneColor1,
                  );
                }
              }
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Featured Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(context, PageTransition(
                          child: const AllCategories(),
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        ));
                      },
                      child: Text(
                        'view all',
                        style: TextStyle(
                          color: zoneColor2,
                          fontSize: 16,
                        ),
                      )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: getProductsHome(index:2,context:context)),
            ),
            const SizedBox(
              height: 20,
            ),
            getSlider(context),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
          ],
        ),
      ),
    );
  }
}
