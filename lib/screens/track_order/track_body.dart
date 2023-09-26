import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:zone_final/screens/track_order/track_map.dart';

Widget getBody(context, int index) {
  switch (index) {
    case 0:
      return Container(
          padding: const EdgeInsets.only(top: 150),
          width: double.infinity,
          child: const RiveAnimation.asset(
            'images/open_package.riv',
            fit: BoxFit.fitWidth,
          ));
    case 2:
      return const SizedBox(
          width: double.infinity,
          child: RiveAnimation.asset(
            'images/hand_shake.riv',
            fit: BoxFit.fitWidth,
          ));
    default:
      return const TrackMap();
  }
}


