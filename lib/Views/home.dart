// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:poloniex_app/Widgets/custom_button.dart';
import 'package:poloniex_app/Widgets/custom_textField.dart';
import 'package:poloniex_app/controllers/homeController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  final List<Color> gradientColors = [
    Colors.white,
    Colors.black38,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crypto",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff437D28),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomTextFormField(
              keyboardType: TextInputType.number,
              hintText: 'Enter any number to trade',
              labelText: 'Enter any number to trade',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
                borderColor: const Color(0xff437D28),
                height: 50,
                buttonText: "Start Trade"),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: Obx(() => LineChart(
                    mainData(),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    // Widget text = Text(formatTimestampToTime(homeController.cryspoData[value.toInt()].data.ts), style: style);
    Widget text = Text(value.toInt().toString(), style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  String formatTimestampToTime(double timestamp) {
    // Create a DateTime object from the timestamp
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp ~/ 1000);

    // Format the DateTime object to a time string
    String formattedTime = DateFormat.jm().format(dateTime);

    return formattedTime;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = const {
          10: '\$12,000',
          30: '\$30,000',
          50: '\$50,000',
          70: '\$70,000',
          90: '\$90,000',
        }[value.toInt()] ??
        '';
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
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
            reservedSize: 80,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: homeController.cryspoData.length - 1,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: [
            // for (final entry in homeController.cryspoData)
            //   FlSpot(, entry.data.price / 1000)

            for (int i = 0; i <= homeController.cryspoData.length - 1; i++)
              FlSpot(
                  i.toDouble(),
                  double.parse(homeController.cryspoData[i].data.bestBidPrice) /
                      1000)
          ],
          color: Colors.black,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          // belowBarData: BarAreaData(
          //   show: true,
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: gradientColors
          //         .map((color) => color.withOpacity(0.3))
          //         .toList(),
          //   ),
          // ),
        ),
      ],
    );
  }
}
