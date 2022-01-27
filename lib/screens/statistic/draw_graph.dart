import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DrawGraph extends StatelessWidget {
  const DrawGraph({Key? key, required this.points}) : super(key: key);

  final List<double> points;

  @override
  Widget build(BuildContext context) {
    List<FlSpot> data = [];

    for (int i = 0; i < points.length; i++) {
      data.add(FlSpot(i.toDouble(), points[i]));
    }
    var bottomTitles = SideTitles(
      showTitles: true,
      reservedSize: 20,
      margin: 5,
      interval: 2,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff72719b),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );

    var healthyTeeth = LineChartBarData(
      isCurved: true,
      colors: [Colors.green],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(0, 0),
        FlSpot(1, 0),
        FlSpot(2, 0),
        FlSpot(3, 0),
        FlSpot(4, 0),
        FlSpot(5, 0),
        FlSpot(6, 0),
      ],
    );

    var badTeeth = LineChartBarData(
      isCurved: true,
      colors: [Colors.red],
      barWidth: 5,
      isStrokeCapRound: false,
      dotData: FlDotData(show: false),
      spots: [
        FlSpot(0, 0),
        FlSpot(1, 2),
        FlSpot(2, 3),
        FlSpot(3, 5),
        FlSpot(4, 6),
        FlSpot(5, 9),
        FlSpot(6, 11),
      ],
    );

    var yourTeeth = LineChartBarData(
      isCurved: true,
      colors: const [Color(0xff27b6fc)],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(0, 0),
        FlSpot(1, 1),
        FlSpot(2, 2),
        FlSpot(3, 2),
        FlSpot(4, 3),
        FlSpot(5, 4),
        FlSpot(6, 6),
      ],
    );

    return LineChart(
      LineChartData(
        axisTitleData: FlAxisTitleData(
          bottomTitle: AxisTitle(
            titleText: "Возраст",
            showTitle: true,
            textStyle: TextStyle(
              color: Color(0xff72719b),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            margin: 10,
          ),
          leftTitle: AxisTitle(
              titleText: "Кариозные зубы",
              showTitle: true,
              textStyle: TextStyle(
                color: Color(0xff72719b),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              margin: 10),
        ),
        lineTouchData: LineTouchData(
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            tooltipRoundedRadius: 50,
            fitInsideHorizontally: true,
          ),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 2,
          verticalInterval: 2,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.grey, strokeWidth: 0.5, dashArray: [10]),
          getDrawingVerticalLine: (value) =>
              FlLine(color: Colors.grey, strokeWidth: 0.5, dashArray: [10]),
        ),
        titlesData: FlTitlesData(
          bottomTitles: bottomTitles,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          leftTitles: bottomTitles,
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black26, width: 2),
            left: BorderSide(color: Colors.black26, width: 2),
            right: BorderSide(color: Colors.black26, width: 2),
            top: BorderSide(color: Colors.black26, width: 2),
          ),
        ),
        lineBarsData: [
          badTeeth,
          healthyTeeth,
          yourTeeth,
        ],
        minX: 0,
        maxX: 6,
        maxY: 12,
        minY: 0,
      ),
    );
  }
}
