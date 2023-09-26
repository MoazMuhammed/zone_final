import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/data/products_handler.dart';
import 'package:zone_final/data/stores_handler.dart';
import 'package:zone_final/models/categories_models.dart';
import 'package:zone_final/screens/all_shops_one.dart';
import 'package:zone_final/screens/all_shops_one/element_shop_grid.dart';
import 'package:zone_final/screens/all_shops_two.dart';

import '../models/commercial_models.dart';
import 'all_shops_two/element_shop_grid.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,),
          )

      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getAllShopCategories(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              if(snapshot.data!.isNotEmpty){
                return Column(
                  children: snapshot.data!.map((e){
                    return AllCategoriesElement(category: e);
                  }).toList(),
                );
              }
              else {
                return const SizedBox();
              }
            }
            else {
              return CircularProgressIndicator(
                color: zoneColor1,
                strokeWidth: 5,
              );
            }
          }
        ),
      ),
    );
  }
}

class AllCategoriesElement extends StatelessWidget {
  final ShopCategory category;
  const AllCategoriesElement({Key? key,required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                child: Text(
                  category.name!,
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(
                      child: (category.id! == 1 )?AllShopsOne(category: category,):AllShopsTwo(category: category,),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: zoneColor1,
                        fontSize: 14
                    ),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: getShopsByCategoryId(category.id!),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                if(snapshot.data!.isNotEmpty){
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: getShopsAllCategories(type: category.id!,shops: snapshot.data!,context:context),
                    ),
                  );
                }
                else{
                  return const SizedBox();
                }
              }
              else {
                return CircularProgressIndicator(
                  color: zoneColor1,
                  strokeWidth: 5,
                );
              }
            }
          ),
        ],
      ),
    );
  }

  Widget getShopsAllCategories({required int type,required List<Shop> shops,required context}){
    List<Widget> widgetsList = shops.map((e){
      Widget element = (type == 1)?
      Container(
          margin: const EdgeInsets.only(right: 12),
          width: MediaQuery.of(context).size.width*0.4,
          child: elementShop1(context, e)
      ):
      SizedBox(
          width: MediaQuery.of(context).size.width*0.4,
          child: elementShop2(context, e)
      );
      return element ;
    }).toList();
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widgetsList,
    );
  }


}

