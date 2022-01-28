import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'circle_information.dart';
import 'header_avatar.dart';
import 'next_visit.dart';

class Body extends StatelessWidget {
  const Body({
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
    int teeth = 0;

    for (bool i in teethUp) if (i) teeth++;
    for (bool i in teethDown) if (i) teeth++;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          HeaderAvatar(
            isGerl: isGerl,
            toTeeth: toTeeth,
            toModel: toModel,
            isComplete: isComplete,
          ),
          SizedBox(height: kDeffaultPadding),
          Text(
            name,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: kDeffaultPadding),
          CircleInformation(age: age, teeth: teeth, isGerl:isGerl),
          SizedBox(height: kDeffaultPadding * 3),
          NextVisit(),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
