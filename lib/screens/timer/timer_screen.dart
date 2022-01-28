import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'body.dart';

class TimerScreen extends StatelessWidget {
  final bool isGerl;
  const TimerScreen({
    Key? key,
    required this.isGerl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Body(isGerl:isGerl),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isGerl ? kSecondaryGirlColor : kSecondaryBoyColor,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: DecorationImage(
            image: AssetImage(isGerl
                ? "assets/images/backgroundTimerGerl.png"
                : "assets/images/backgroundTimerBoy.png"),
          ),
        ),
      ),
    );
  }
}
