import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone_final/blocs/active_user/active_user_bloc.dart';
import 'package:zone_final/blocs/landing_page/landing_page_bloc.dart';
import 'package:zone_final/data/user_handlers.dart';
import '../colors.dart';
import '../models/user_models.dart';
import 'login_register/custom_button.dart';
import 'login_register/custom_text_field.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  int chosenPage = 0;

  GlobalKey<FormState> form1Key = GlobalKey<FormState>();
  GlobalKey<FormState> form2Key = GlobalKey<FormState>();
  GlobalKey<FormState> form3Key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordControllerConfirm = TextEditingController();

  TextEditingController phoneController2 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.25,
              child: Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.37,
                    height: MediaQuery.of(context).size.height*0.18,
                    child: Image.asset('images/logozone.png',fit: BoxFit.fill,)
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Welcome to your ZONE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Everything you desire ',
                style: TextStyle(
                    fontSize: 16,
                    color: zoneColor2
                ),
              ),
            ),
            form(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    (chosenPage == 0)?'Don’t have account?':'Already have account!',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14
                    ),
                ),
                TextButton(
                    onPressed: (chosenPage == 0)?(){
                      setState(() {
                        chosenPage = 1;
                      });
                    }:(){
                      setState(() {
                        chosenPage =0;
                      });
                    },
                    child: Text(
                      (chosenPage == 0)?'Register':'Sign in',
                      style: TextStyle(
                          color: zoneColor2,
                          fontSize: 16
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.08,
            ),
          ],
        ),
      ),
    );
  }

  Widget form() {
    switch(chosenPage){
      case 1:
        return Form(
          key: form1Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(textFieldType: 0, labelText: 'Full name', validator: (value){
                if(value!.isEmpty){
                  return 'Please enter your name';
                }
                return null;
                },controller: nameController,),
              CustomTextField(textFieldType: 1, labelText: 'E-mail',controller: emailController ,validator: (value){
                if(! value!.contains('@')||!value.contains('.com')){
                  return 'Please enter a valid e-mail!';
                }
                return null;
              }),
              CustomTextField(textFieldType: 2, labelText: 'Phone number',controller: phoneController1,validator: (value){
                if(! value!.startsWith('01')){
                  return 'Please enter a valid phone number!';
                }
                return null;
              }),
              CustomButton(text: 'Next', onPressed: (){
                if(form1Key.currentState!.validate()){
                  setState(() {
                    chosenPage = 2;
                  });
                }
              })
            ],
          ),
        );
      case 2:
        return Form(
          key: form2Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(textFieldType: 3, labelText: 'create password',controller: passwordController1 ,validator: (value){
                if( value == null){
                  return 'This field can not be empty';
                }
                return null;
              }),
              CustomTextField(textFieldType: 3, labelText: 'confirm password',controller: passwordControllerConfirm,validator: (value){
                if( value != passwordController1.text){
                  return 'Password does not match';
                }
                return null;
              }),
              CustomButton(text: 'Register', onPressed: (){
                if(form2Key.currentState!.validate()){
                  try {
                    register();
                    BlocProvider.of<LandingPageBloc>(context).add(LandingPageIndexChangedEvent(newIndex: 0));
                    Fluttertoast.showToast(msg: 'Registering completed successfully \n please log in to start session');
                  }
                  catch(e){
                    Fluttertoast.showToast(msg: 'Registering can not be processes: \n ${e.toString()}');
                  }

                }
              })
            ],
          ),
        );
      default:
        return Form(
          key: form3Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(textFieldType: 1, labelText: 'email',controller: phoneController2 ,validator: (value){
                if( value!.isEmpty){
                  return 'Please enter your email';
                }else if(!value.contains('@')|| !value.contains('.com')){
                  return 'Please enter a valid email';
                }
                return null;
              }),
              CustomTextField(textFieldType: 3, labelText: 'password',controller: passwordController2,validator: (value){
                if( value!.isEmpty){
                  return 'Please enter your password';
                }
                return null;
              }),
              CustomButton(text: 'Login', onPressed: (){
                if(form3Key.currentState!.validate()){
                  try {
                    logInUser();
                    BlocProvider.of<LandingPageBloc>(context).add(LandingPageIndexChangedEvent(newIndex: 3));
                  }
                  catch(e){
                    Fluttertoast.showToast(msg: 'Can’t log in: \n ${e.toString()}');
                  }                }
              })
            ],
          ),
        );
    }
  }

  void register() {
    Client client = Client(
      name: nameController.text,
      email: emailController.text.trim(),
      password: passwordController1.text.trim(),
      phone: phoneController1.text,
    );
    addUser(client);
  }

  // credentials of log in function
  void logInUser() async {
    logIn({
      'email': phoneController2.text,
      'password':passwordController2.text,
    }).then((value) async {
      print(value.toString());
      savedToken = value;
      BlocProvider.of<ActiveUserBloc>(context).add(ActiveUserChangedEvent(token: savedToken));
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', savedToken);
    });
  }



}







