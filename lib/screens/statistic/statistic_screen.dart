import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'body.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key? key, required this.points, required this.isGerl}) : super(key: key);
  final double? points;
  final bool isGerl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isGerl ? kSecondaryGirlColor : kSecondaryBoyColor,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Body(points: points),
        ),
      ),
    );
  }
}
