import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/all_products_data.dart';

Widget getSlider(context){
  return CarouselSlider.builder(
      itemCount: ads.length,
      itemBuilder: (context,itemIndex,pageViewIndex){
        return GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width*0.98,
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(ads[itemIndex],fit: BoxFit.cover,)),
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height*0.25,
        viewportFraction: 0.95,
        initialPage: 0,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
      )
  );
}