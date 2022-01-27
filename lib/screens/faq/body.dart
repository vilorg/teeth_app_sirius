import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/models/text_title.dart';

import 'search_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(kDeffaultPadding),
        child: Column(
          children: [
            TextTitle(title: "Самые частые вопросы"),
            SizedBox(height: 2 * kDeffaultPadding),
            SearchField(),
          ],
        ),
      ),
    );
  }
}
