import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/commercial_models.dart';
import '../all_products_one.dart';


Widget getShopsList({required context,required List<Shop> shops}){

  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.separated(
        itemBuilder: (context,index)=> elementShop1List(context, shops[index],index),
        separatorBuilder: (context,index)=>const SizedBox(height: 10,),
        itemCount: shops.length
    )
  );
}

Widget elementShop1List(context, Shop shop,int index ){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, PageTransition(
          child: const AllProductsOne(),
      type: PageTransitionType.rightToLeft,
      duration: const Duration(milliseconds: 500),
      )
      );
    },
    child: SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.28,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.15,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.zero,
                        top: Radius.circular(20)
                    ),
                    child: Image.network(shop.coverPhoto!,fit: BoxFit.fill,),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 12.0,bottom: 5),
                            child: Text('${shop.name}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Text('${shop.shopDescription}',
                            style: const TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0,top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.27,
                  height: MediaQuery.of(context).size.height*0.11,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(shop.logo!,fit: BoxFit.fill,),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}