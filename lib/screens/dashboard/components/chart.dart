import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Chart extends StatelessWidget {
  Chart({
    required this.values,
    required this.valuess,
    required this.valuesss,
    required this.valuessss,
  });

  final values, valuess, valuesss, valuessss;

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> paiChartSelectionDatas = [
      PieChartSectionData(
        color: primaryColor,
        value: valuess,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: Color(0xFF26E5FF),
        value: valuessss,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: Color(0xFFFFCF26),
        value: values,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: Color(0xFFEE2727),
        value: valuesss,
        showTitle: false,
        radius: 16,
      ),
    ];

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("of 128GB")
              ],
            ),
          ),
        ],
      ),
    );
  }

  // List<PieChartSectionData> paiChartSelectionDatas = [
  //   PieChartSectionData(
  //     color: primaryColor,
  //     value: values,
  //     showTitle: false,
  //     radius: 25,
  //   ),
  //   PieChartSectionData(
  //     color: Color(0xFF26E5FF),
  //     value: 20,
  //     showTitle: false,
  //     radius: 22,
  //   ),
  //   PieChartSectionData(
  //     color: Color(0xFFFFCF26),
  //     value: 10,
  //     showTitle: false,
  //     radius: 19,
  //   ),
  //   PieChartSectionData(
  //     color: Color(0xFFEE2727),
  //     value: 5,
  //     showTitle: false,
  //     radius: 16,
  //   ),
  //   PieChartSectionData(
  //     color: primaryColor.withOpacity(0.1),
  //     value: 25,
  //     showTitle: false,
  //     radius: 13,
  //   ),
  // ];
}
