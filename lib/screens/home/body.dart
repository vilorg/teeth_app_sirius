import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

import 'btn_analys.dart';
import 'circle_information.dart';
import 'header_avatar.dart';
import 'next_visit.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          HeaderAvatar(),
          SizedBox(height: kDeffaultPadding),
          Text(
            "Baby",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: kDeffaultPadding),
          CircleInformation(),
          SizedBox(height: kDeffaultPadding * 3),
          NextVisit(),
          BtnAnalys(),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
