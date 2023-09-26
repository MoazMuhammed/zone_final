import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordControllerConfirm = TextEditingController();

  bool changed = false;


  @override
  void initState() {
    passwordController1.text = '123456789';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Change password',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: getBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(){
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(onChanged: (value){
            setState(() {
              changed = true;
            });
          },textFieldType: 3, labelText: 'create password',controller: passwordController1 ,validator: (value){
            if( value!.isEmpty){
              return 'This field can not be empty';
            }
            return null;
          }),
          CustomTextField(onChanged: (value){},textFieldType: 3, labelText: 'confirm password',controller: passwordControllerConfirm,validator: (value){
            if( value != passwordController1.text){
              return 'Password does not match';
            }
            return null;
          }),
          getCustomButton(
              enabled: changed,
              text: 'Save new password', onPressed:(changed)? (){
            if(formKey.currentState!.validate()){
              setState(() {
                changed = false;
              });
            }
          }:(){}
          )
        ],
      ),
    );
  }

  Widget getCustomButton({required String text,required VoidCallback onPressed,required bool enabled}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (enabled)?zoneColor2:Colors.grey,
        ),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.08,
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final Function(String) onChanged;
  final int textFieldType;
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.textFieldType,
    required this.labelText,
    required this.validator,
    required this.controller,
    required this.onChanged
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
        onChanged: widget.onChanged,
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



