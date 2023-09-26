import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors.dart';

void launchPhone() async {
  if (!await launchUrl(Uri.parse("tel://+201019334494"),
      mode: LaunchMode.externalApplication)) {
    throw 'Could not launch ';
  }
}

Widget getStepContent(context, int index) {
  switch (index) {
    case 0:
      return const Text(
        'Your order is being prepared and a delivery guy will go fetch it soon.',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, color: Colors.black54),
      );
    case 2:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your order has arrived !',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 20, color: zoneColor1, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: zoneColor2,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: const Center(
                  child: Text(
                    'I did receive it, thanks',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    default:
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: zoneColor1,
                width: 1
              ),
              boxShadow: [
                BoxShadow(
                  color: zoneColor2,
                  spreadRadius: -5,
                  blurRadius: 10
                ),
              ]
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: Image.asset('images/profile_image.jpg').image,
            ),
          ),
          title: const Text('Amr kamel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          subtitle: Row(
            children: const [
              Text('4.0'),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.star,size: 15,),
              )
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width* 0.15,
            height: MediaQuery.of(context).size.height* 0.07,
            decoration: BoxDecoration(
              color: productElement1,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    launchPhone();
                  },
                  icon: const Icon(Icons.phone_forwarded,color: Colors.black54,)
              ),
            ),
          ),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
              child: Text('Estimated Time :',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
              child: Text('20-30 Minutes',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            ),
          ],
        ),
      ],
    );

  }
}
