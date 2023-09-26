import 'package:flutter/material.dart';

import '../../colors.dart';

class ElementVouchers extends StatefulWidget {
  final String categoryName;
  final bool isChosen;

  const ElementVouchers(
      {Key? key, required this.categoryName, required this.isChosen})
      : super(key: key);

  @override
  State<ElementVouchers> createState() => _ElementVouchersState();
}
class _ElementVouchersState extends State<ElementVouchers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          color: (widget.isChosen) ? zoneColor1 : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: zoneColor1)),
      child: Center(
        child: Text(
          widget.categoryName,
          style: TextStyle(
            color: (!widget.isChosen) ? zoneColor1 : Colors.white,
            fontSize: 14,
            fontWeight:
            (!widget.isChosen) ? FontWeight.normal : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}