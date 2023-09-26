import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/About.dart';
import '../colors.dart';
import 'account_info.dart';
import 'change_password.dart';
import 'localized_choice.dart';

class Settings extends StatefulWidget {

  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationsAllowed = true ;

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
          centerTitle: true,
          title: const Text('Settings',
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
          ),
          getProfileElement(
            context: context,
            title: 'Account info',
            trailing: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context, PageTransition(
                    child: const AccountInfo(),
                    type: PageTransitionType.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                  ));
                },
                icon: Icon(Icons.arrow_forward_ios, color: zoneColor1)),
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
            child: Divider(
              height: 2,
              color: productElement2,
            ),
          ),
          getProfileElement(
              context: context,
              title: 'Change Password',
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: IconButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                        child: const ChangePassword(),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      ));
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: zoneColor1)),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
            child: Divider(
              height: 2,
              color: productElement2,
            ),
          ),
          getProfileElement(
              context: context,
              title: 'Language',
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: IconButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                        child: const LocalizedChoice(type: 'l'),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      ));
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: zoneColor1)),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
            child: Divider(
              height: 2,
              color: productElement2,
            ),
          ),
          getProfileElement(
              context: context,
              title: 'Country',
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: IconButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                        child: const LocalizedChoice(type: 'c'),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      ));
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: zoneColor1)),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
            child: Divider(
              height: 2,
              color: productElement2,
            ),
          ),
          getProfileElement(
              context: context,
              title: 'About app',
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: IconButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                        child: const About(),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      ));
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: zoneColor1)),
              )
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.08,
            color: productElement1,
          ),
          getProfileElement(
              context: context,
              title: 'Notifications',
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Switch(
                  onChanged: (bool value){
                    setState(() {
                      notificationsAllowed = value;
                    });
                  },
                  value: notificationsAllowed,
                  activeColor: zoneColor1,
                )
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
            child: Divider(
              height: 2,
              color: productElement2,
            ),
          ),
          getProfileElement(
              context: context,
              title: 'Log out',
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.logout, color: zoneColor1)),
              )
          ),
          Expanded(
            child:Container(
            width: double.infinity,
            color: productElement1,
          ),
          ),
        ],
      )
    );
  }
}

Widget getProfileElement({required BuildContext context,required String title,required Widget trailing}){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          trailing,
        ],
      ),

    ],
  );
}

