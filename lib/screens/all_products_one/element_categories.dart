import 'package:flutter/material.dart';

class ElementCategories extends StatefulWidget {
  final String categoryName;
  final bool isChosen;

  const ElementCategories(
      {Key? key, required this.categoryName, required this.isChosen})
      : super(key: key);

  @override
  State<ElementCategories> createState() => _ElementCategoriesState();
}
class _ElementCategoriesState extends State<ElementCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: (widget.isChosen) ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.black)),
      child: Center(
        child: Text(
          widget.categoryName,
          style: TextStyle(
            color: (!widget.isChosen) ? Colors.black : Colors.white,
            fontSize: 16,
            fontWeight:
            (!widget.isChosen) ? FontWeight.normal : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}