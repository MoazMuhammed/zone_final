import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/models/categories_models.dart';
import '../../colors.dart';
import '../all_shops_one.dart';
import '../all_shops_two.dart';

class CategoryElement extends StatelessWidget {
  final ShopCategory category;
  const CategoryElement({Key? key,required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(
          child: (category.id == 1 )?AllShopsOne(category: category,):AllShopsTwo(category: category,),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 500),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 16),
        width: MediaQuery.of(context).size.width* 0.3,
        height: MediaQuery.of(context).size.height* 0.15,
        decoration: BoxDecoration(
          color: productElement1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width* 0.25,
              height: MediaQuery.of(context).size.height* 0.1,
              child: Image.network(category.image!,fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                category.name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
