import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/faqs.dart';
import 'package:zone_final/screens/privacy_policy.dart';
import 'package:zone_final/screens/rate_app.dart';
import 'package:zone_final/screens/terms.dart';
import '../colors.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {

  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  void launchInstagram() async {
    if (!await launchUrl(Uri.parse("https://www.instagram.com/kamula010/"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }

  void launchFacebook() async {
    if (!await launchUrl(Uri.parse("https://www.facebook.com/profile.php?id=100002234768572&mibextid=ZbWKwL"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
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
          centerTitle: true,
          title: const Text('About app',
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
            getAboutElement(
                context: context,
                title: 'FAQs',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, PageTransition(
                          child: const FAQs(),
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
            getAboutElement(
                context: context,
                title: 'Terms of use',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, PageTransition(
                          child: const Terms(),
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
            getAboutElement(
                context: context,
                title: 'Privacy Policy',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, PageTransition(
                          child: const PrivacyPolicy(),
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
            getAboutElement(
                context: context,
                title: 'Rate app',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, PageTransition(
                          child: const RateApp(),
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
            getAboutElement(
                context: context,
                title: 'Facebook',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        launchFacebook();
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
            getAboutElement(
                context: context,
                title: 'Instagram',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        launchInstagram();
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: zoneColor1)),
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

Widget getAboutElement({required BuildContext context,required String title,required Widget trailing}){
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

