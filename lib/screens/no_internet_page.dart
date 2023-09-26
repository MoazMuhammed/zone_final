import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/colors.dart';

class NoInternetPage extends StatefulWidget {
  final AsyncCallback  function;
  const NoInternetPage({Key? key,required this.function}) : super(key: key);

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.4,
            child: Image.asset('images/logozone.png',fit: BoxFit.fitHeight,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05 ,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Sorry, no internet connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),),
          ),
          (isLoading)?Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: zoneColor1,
              strokeWidth: 5,
            ),
          ):GestureDetector(
            onTap: (){
              setState(() {
                isLoading = true;
              });
              widget.function.call().then((value){
                setState(() {
                  isLoading = false;
                });
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [
                      zoneColor1,
                      zoneColor2
                    ]
                ),
              ),
              child: const Text('Try again',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,decoration: TextDecoration.none),),
            ),
          ),
        ],
      ),
    );
  }
}
