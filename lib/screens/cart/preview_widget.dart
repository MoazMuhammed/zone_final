import 'package:flutter/material.dart';
import 'package:zone_final/colors.dart';

Widget previewWidget(context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: productElement1,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    child: Column(
      children: <Widget>[
        Icon(Icons.keyboard_arrow_up, size: 30, color: productElement2),
        const Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            'Preview check',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    ),
  );
}
