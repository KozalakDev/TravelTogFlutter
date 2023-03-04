import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:travel_tog/consts.dart';
import 'package:travel_tog/size_config.dart';

class LinearRateBar extends StatelessWidget {
  const LinearRateBar({super.key, this.icon, required this.rate});
  final IconData? icon;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: LinearPercentIndicator(
        animation: false,
        leading: Icon(icon, size: 20),
        barRadius: const Radius.circular(30),
        // width: SizeConfig.screenWidth! * 1.5 / 5 - 20,
        lineHeight: SizeConfig.screenHeight! / 100,
        percent: rate,
        backgroundColor: Colors.grey.shade200,
        progressColor: starColor,
      ),
    );
  }
}
