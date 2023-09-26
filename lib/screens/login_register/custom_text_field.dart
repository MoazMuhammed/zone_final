import 'package:flutter/material.dart';

import '../../colors.dart';

class CustomTextField extends StatefulWidget {
  final int textFieldType;
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.textFieldType,
    required this.labelText,
    required this.validator,
    required this.controller
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: productElement1,
      ),
      width: MediaQuery.of(context).size.width*0.9,
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: (widget.textFieldType == 3)?obscure:false,
        keyboardType: (widget.textFieldType == 0)?TextInputType.name:
        (widget.textFieldType == 1)?TextInputType.emailAddress:
        (widget.textFieldType == 2)?TextInputType.phone:
        TextInputType.visiblePassword,
        validator: widget.validator,
        cursorColor: zoneColor1,
        style: TextStyle(
            color: zoneColor2
        ),
        decoration: InputDecoration(
            suffixIconColor: Colors.grey,
            suffixIcon: (widget.textFieldType == 3)?IconButton(
              onPressed: (){
                setState(() {
                  obscure = !obscure;
                });
              },
              icon: const Icon(Icons.remove_red_eye),
            ):const SizedBox(),
            labelText: widget.labelText,
            labelStyle: const TextStyle(
                color: Colors.grey
            ),
            border: InputBorder.none
        ),
      ),
    );
  }
}