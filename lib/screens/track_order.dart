import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/screens/track_order/step_content.dart';
import 'package:zone_final/screens/track_order/track_body.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {

  int currentStep = 1;

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
        title: const Text('Order tracking',
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
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.65,
            child: getBody(context, currentStep),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(
                  onPrimary: zoneColor1
                )
              ),
              child: Stepper(
                currentStep: currentStep,
                elevation: 0,
                controlsBuilder: (context,details){
                  return const SizedBox();
                },
                type: StepperType.horizontal,
                steps: [
                  Step(
                    isActive: currentStep >=0,
                    title: const Text('Preparing',style: TextStyle(fontSize: 10),),
                    content: getStepContent(context,0)
                  ),
                  Step(
                    isActive: currentStep >=1,
                    title: const Text('On the way',style: TextStyle(fontSize: 10)),
                    content: getStepContent(context, 1),
                  ),
                  Step(
                    isActive: currentStep >=2,
                    title: const Text('By your doorstep',style: TextStyle(fontSize: 10)),
                    content: getStepContent(context,2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
