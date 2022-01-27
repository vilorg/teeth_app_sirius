import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/models/text_title.dart';

import 'dental_part_base.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<bool> isVisibleUp = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<bool> isVisibleDown = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextTitle(title: "Модель зубов"),
          SizedBox(height: 2 * kDeffaultPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DentalPartBase(
                isVisible: isVisibleUp,
                setVisible: (index) =>
                    setState(() => isVisibleUp[index] = !isVisibleUp[index]),
              ),
              SizedBox(height: 2 * kDeffaultPadding),
              Transform.rotate(
                angle: pi,
                child: DentalPartBase(
                  isVisible: isVisibleDown,
                  setVisible: (index) => setState(
                      () => isVisibleDown[index] = !isVisibleDown[index]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
