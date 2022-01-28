import 'package:flutter/material.dart';
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
  }) : super(key: key);
  final String name;
  final bool isGerl;
  final List<bool> teethUp;
  final List<bool> teethDown;
  final int age;
  final VoidCallback toTeeth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Body(
        isGerl: isGerl,
        age: age,
        name: name,
        teethDown: teethDown,
        teethUp: teethUp,
        toTeeth: toTeeth,
      ),
    );
  }
}
