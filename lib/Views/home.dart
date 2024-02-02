import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:poloniex_app/controllers/homeController.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = HomeController();
  HomeScreen({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    Colors.white,
    Colors.black38,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff437D28),
        title: const Text(
          "Cryprochart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: 
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: () {
              homeController.fetchToken();
              homeController.status = true;
            }, child: const Text("Trade")),
            SizedBox(
              width: 2000,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 12.0, top: 24, bottom: 12),
                child: Obx(() =>  LineChart(
                  mainData(),
                ),)
              ),
            ),
          ],
        ),
      ),)
    ;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text = const Text('', style: style);

    final step = homeController.cryspoData.length ~/ 4;
    if (value.toInt() % step == 0) {
      final index = value.toInt() ~/ step;
      text = Text('0:${(index * 5).toString().padLeft(2, '0')}', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = const {
          1: '10K',
          3: '30K',
          5: '50K',
          7: '70K',
          9: '90K',
        }[value.toInt()] ??
        '';
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: homeController.cryspoData.length - 1,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            for (final entry in homeController.cryspoData)
              FlSpot(double.parse(entry.data.bestBidPrice), double.parse(entry.data.bestAskPrice))
          ],
          color: Colors.white,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// final data = [
//   3.45,
//   2.14,
//   1.88,
//   2.02,
//   2.25,
//   2.20,
//   2.18,
//   2.49,
 
  
// ].asMap();
