import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'body.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.isGerl}) : super(key: key);
  final bool isGerl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
          child: Body(),
        ),
      ),
    );
  }
}
