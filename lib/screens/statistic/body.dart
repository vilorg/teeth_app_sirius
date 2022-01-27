import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/models/text_title.dart';

import 'draw_graph.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<double> data = [0, 1, 2, 2, 3, 4, 6];

    return SingleChildScrollView(
      padding: EdgeInsets.all(kDeffaultPadding),
      child: Column(
        children: [
          TextTitle(title: "Статистика"),
          SizedBox(height: kDeffaultPadding * 3),
          Container(
            width: double.infinity,
            height: 400,
            padding: EdgeInsets.all(kDeffaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black45, width: 2),
            ),
            child: DrawGraph(points: data),
          ),
        ],
      ),
    );
  }
}
