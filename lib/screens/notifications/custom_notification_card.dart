import 'package:flutter/material.dart';

import '../../colors.dart';

class CustomNotificationCard extends StatelessWidget {
  final Map<String,dynamic> notification;
  const CustomNotificationCard({Key? key,required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.12,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                      child: Image.asset(notification['shop_image'],fit: BoxFit.fitWidth,)),
                ],
              )
          ),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0,left: 12.0),
                    child: Text(
                      notification['shop_name'],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0,left: 12.0),
                    child: Text(
                      notification['details'],
                      style:  const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0,left: 12.0),
                    child: Text(
                      'on: ${notification['date_time']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),

                ],
              )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height*0.025,
                  backgroundColor: zoneColor1,
                  child: IconButton(
                    onPressed: (){
                    },
                    icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
