import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors.dart';

SliverAppBar getSliverAppBar({required context,required product}){
  return SliverAppBar(
    backgroundColor: productElement2.withOpacity(0.1),
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
                MediaQuery.of(context).size.width*0.3
            ),
            bottomRight: Radius.circular(
                MediaQuery.of(context).size.width*0.3
            )
        )
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: productElement2.withOpacity(0.1),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
    ],
    expandedHeight: MediaQuery.of(context).size.height*0.35,
    flexibleSpace: FlexibleSpaceBar(
      background: SizedBox(
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    spreadRadius: -38,
                    blurRadius: 10,
                    offset: Offset(0, 48)),
              ]),
              child: Image.asset(
                product['image'],
                fit: BoxFit.fill,
              )),
        ),
      ),
    ),
  );
}