import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.isGerl,
    required this.name,
    required this.teethUp,
    required this.teethDown,
    required this.age,
    required this.toTeeth,
    required this.toModel,
    required this.isComplete,
  }) : super(key: key);
  final String name;
  final bool isGerl;
  final List<bool> teethUp;
  final List<bool> teethDown;
  final int age;
  final VoidCallback toTeeth;
  final VoidCallback toModel;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Theme(
        data: ThemeData(
            primaryColor: isGerl ? kSecondaryGirlColor : kPrimaryBoyColor),
        child: Body(
          isGerl: isGerl,
          age: age,
          name: name,
          teethDown: teethDown,
          teethUp: teethUp,
          isComplete: isComplete,
          toTeeth: toTeeth,
          toModel: toModel,
        ),
      ),
    );
  }
}
