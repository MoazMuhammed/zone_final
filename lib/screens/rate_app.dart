import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/screens/rate_app/get_help.dart';
import 'package:zone_final/screens/rate_app/leave_comment.dart';
import 'package:zone_final/screens/rate_app/rate_bar.dart';

class RateApp extends StatefulWidget {
  const RateApp({Key? key}) : super(key: key);

  @override
  State<RateApp> createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
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
        title: const Text('App feedback',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.14,
              ),
              AutoSizeText(
                'How would you rate your zone ?',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: zoneColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              const RateBar(),
              const SizedBox(
                height: 10,
              ),
              Divider(
                height: 2,
                color: productElement2,
              ),
              const LeaveComment(),
              const SizedBox(
                height: 10,
              ),
              Divider(
                height: 2,
                color: productElement2,
              ),
              const GetHelp(),
            ],
          ),
        ),
      ),
    );
  }
}



