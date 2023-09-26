import 'package:flutter/material.dart';

import '../../colors.dart';

Widget getCustomTextFieldAddress({
  required BuildContext context,
  required int textFieldType,
  required String labelText,
  required String? Function(String?)  validator,
  required Function(String) onChanged,
  required TextEditingController controller,
}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: productElement1,
    ),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: (textFieldType == 0)?TextInputType.name:
      (textFieldType == 1)?TextInputType.number:
      TextInputType.streetAddress,
      validator: validator,
      cursorColor: zoneColor1,
      style: TextStyle(
        color: zoneColor2,
      ),
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey
          ),
          border: InputBorder.none
      ),
    ),
  );
}