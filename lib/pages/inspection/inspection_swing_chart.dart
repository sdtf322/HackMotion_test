import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hackmotion_test_opliska/design/colors.dart';
import 'package:hackmotion_test_opliska/design/dimensions.dart';

import '../../data/model/swing.dart';

class InspectionSwingGraph extends StatelessWidget {
  final Swing swing;

  const InspectionSwingGraph({super.key, required this.swing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: convertToSpots(swing.parameters.hfaCrWrFlexEx.values, 20),
              color: flexionColor,
              isCurved: true,
              barWidth: 3,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: convertToSpots(swing.parameters.hfaCrWrRadUln.values, 20),
              color: radialColor,
              isCurved: true,
              barWidth: 3,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(),
            bottomTitles: AxisTitles(),
          ),
          gridData: const FlGridData(show: true),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}

List<FlSpot> convertToSpots(List<double> data, int maxPoints) {
  int step = (data.length / maxPoints).ceil();
  return List<FlSpot>.generate(
    (data.length / step).ceil(),
        (index) => FlSpot(index.toDouble(), data[index * step]),
  );
}