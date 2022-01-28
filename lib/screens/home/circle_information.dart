import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'circle_information_item.dart';

class CircleInformation extends StatelessWidget {
  const CircleInformation({
    Key? key,
    required this.age,
    required this.teeth,
    required this.isGerl,
  }) : super(key: key);

  final int age;
  final int teeth;
  final bool isGerl;

  @override
  Widget build(BuildContext context) {
    String teethTitle = "зубов";
    if (teeth == 1) teethTitle = "зуб";
    if (teeth >= 2 && teeth <= 4) teethTitle = "зуба";
    String mounthTitle = "месяцев";
    if (age == 1) teethTitle = "месяц";
    if (teeth >= 2 && teeth <= 4) mounthTitle = "месяца";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleInformationItem(count: age, title: mounthTitle),
        SizedBox(width: kDeffaultPadding * 2),
        CircleInformationItem(count: teeth, title: teethTitle),
        SizedBox(width: kDeffaultPadding * 2),
        CircleInformationItem(count: 0, title: "угроз"),
      ],
    );
  }
}
