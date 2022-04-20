/// import libraries
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget pieChart(Map data, TooltipBehavior _tooltipBehavior) {
  final List<PieOccupancyData> chartData = [
    PieOccupancyData('Occupied', data['occupied'], const Color(0xFFB09FFF)),
    PieOccupancyData('Available', data['available'], const Color(0xFFC6CACE)),
  ];
  const int totalSpace = 3217;
  int percentage = (data['occupied'] / totalSpace * 100).toInt();

  /// protect overflow
  if (percentage > 100) {
    percentage = 100;
  }
  return SizedBox(
    width: 150.0,
    height: 160.0,
    child: SfCircularChart(
      tooltipBehavior: _tooltipBehavior,
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          height: '120%',
          width: '120%',
          widget: PhysicalModel(
            shape: BoxShape.circle,
            elevation: 10,
            shadowColor: Colors.black,
            color: const Color.fromRGBO(230, 230, 230, 1),
            child: Container(),
          ),
        ),
        CircularChartAnnotation(
          widget: Text(
            percentage.toString() + '%',
            style: const TextStyle(
              color: Color(0xFF343A40),
              fontSize: 23.0,
            ),
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<PieOccupancyData, String>(
          dataSource: chartData,
          xValueMapper: (PieOccupancyData data, _) => data.floor,
          yValueMapper: (PieOccupancyData data, _) => data.people,
          pointColorMapper: (PieOccupancyData data, _) => data.chartColour,
          enableTooltip: true, // enable tooltip function
          radius: '100%', // radius of the chart
        )
      ],
    ),
  );
}

class PieOccupancyData {
  final String floor;
  final int people;
  final Color chartColour;
  PieOccupancyData(this.floor, this.people, this.chartColour);
}
