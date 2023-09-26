import 'package:flutter/material.dart';

import '../../colors.dart';

class EstimatedTime extends StatelessWidget {
  const EstimatedTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.watch_later_outlined,color: zoneColor1,),
            ),
            const Text('Within 18 min',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
