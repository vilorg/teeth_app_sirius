import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'circle_information_item.dart';

class CircleInformation extends StatelessWidget {
  const CircleInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleInformationItem(count: 17, title: "месяцев"),
        SizedBox(width: kDeffaultPadding * 2),
        CircleInformationItem(count: 2, title: "зуба"),
        SizedBox(width: kDeffaultPadding * 2),
        CircleInformationItem(count: 0, title: "угроз"),
      ],
    );
  }
}
