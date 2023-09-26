import 'package:flutter/material.dart';
import 'package:zone_final/colors.dart';

class ElementCategories2 extends StatefulWidget {
  final String categoryName;
  final bool isChosen;

  const ElementCategories2(
      {Key? key, required this.categoryName, required this.isChosen})
      : super(key: key);

  @override
  State<ElementCategories2> createState() => _ElementCategories2State();
}
class _ElementCategories2State extends State<ElementCategories2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: (widget.isChosen) ? zoneColor1 : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: zoneColor1)),
      child: Center(
        child: Text(
          widget.categoryName,
          style: TextStyle(
            color: (!widget.isChosen) ? zoneColor1 : Colors.white,
            fontSize: 16,
            fontWeight:
            (!widget.isChosen) ? FontWeight.normal : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}