import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/models/text_title.dart';

import 'dental_part_base.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<bool> teethUp = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> teethDown = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    getData();
    super.initState();
  }

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
                isVisible: teethUp,
                setVisible: (index) {
                  setState(
                    () => teethUp[index] = !teethUp[index],
                  );
                  updateTeeth();
                },
              ),
              SizedBox(height: 2 * kDeffaultPadding),
              Transform.rotate(
                angle: pi,
                child: DentalPartBase(
                  isVisible: teethDown,
                  setVisible: (index) {
                    setState(
                      () => teethDown[index] = !teethDown[index],
                    );
                    updateTeeth();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getData() async {
    var box = await Hive.openBox("startBox");

    setState(() {
      teethUp = box.get("teethUp");
      teethDown = box.get("teethDown");
    });
  }

  Future<void> updateTeeth() async {
    var box = await Hive.openBox("startBox");
    box.put("teethUp", teethUp);
    box.put("teethDown", teethDown);
  }
}
