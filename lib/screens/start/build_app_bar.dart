import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Image.asset(
      "assets/images/logo.png",
      width: 60,
    ),
    centerTitle: true,
    leading: getArrow(context),
    leadingWidth: 4 * kDeffaultPadding,
  );
}

Widget getArrow(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: kDeffaultPadding * 1.5),
    child: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black54, width: 2),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
