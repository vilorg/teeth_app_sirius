import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/models/text_title.dart';

import 'draw_graph.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.points,
  }) : super(key: key);

  final double? points;

  @override
  Widget build(BuildContext context) {
    List<double> coef = [0, 1, 2, 3, 4, 5.5, 6.5];
    List<double> data = [0, 0, 0, 0, 0, 0, 0];

    if (points != null) {
      for (int i = 0; i < data.length; i++) {
        data[i] = double.parse((coef[i] * points!).toStringAsFixed(2));
      }
    }
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
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 20),
                ]),
            child: DrawGraph(points: data),
          ),
        ],
      ),
    );
  }
}
