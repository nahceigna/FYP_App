import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

Widget barChart(String selectedLocation, int selectedDay) {
  return SizedBox(
    height: 215.0,
    child: Card(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      // color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 5, 5, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    // child: BarChart(barData()),
                    child: LineChart(lineData(selectedDay)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

LineChartData lineData(int day) {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: 200,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xFFE9ECEF),
          strokeWidth: 1,
        );
      },
    ),
    lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
      getTooltipItems: (value) {
        return value
            .map((e) => LineTooltipItem("People: ${(e.y).toStringAsFixed(0)}",
                const TextStyle(fontSize: 12.0, color: Colors.white)))
            .toList();
      },
      tooltipBgColor: Colors.black,
    )),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 10,
        interval: 1,
        getTextStyles: (context, value) =>
            const TextStyle(color: Color(0xFF6C757D), fontSize: 12),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return '2am';
            case 6:
              return '6am';
            case 10:
              return '10am';
            case 14:
              return '2pm';
            case 18:
              return '6pm';
            case 22:
              return '10pm';
          }
          return '';
        },
        margin: 5,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xFF6C757D),
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 199:
              return '200';
            case 399:
              return '400';
            case 599:
              return '600';
            case 799:
              return '800';
          }
          return '';
        },
        reservedSize: 20,
        margin: 10,
      ),
    ),
    borderData: FlBorderData(show: false),
    minX: 0,
    maxX: 23,
    minY: 0,
    maxY: 1000,
    lineBarsData: [
      LineChartBarData(
        spots: dataList[day],
        isCurved: true,
        colors: gradientColors,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}

const List<List<FlSpot>> dataList = [
  /// monday
  [
    FlSpot(0, 100),
    FlSpot(2, 70),
    FlSpot(4, 200),
    FlSpot(6, 500),
    FlSpot(8, 600),
    FlSpot(10, 650),
    FlSpot(12, 700),
    FlSpot(14, 800),
    FlSpot(16, 750),
    FlSpot(18, 700),
    FlSpot(20, 400),
    FlSpot(22, 200),
    FlSpot(23, 150),
  ],

  /// tuesday
  [
    FlSpot(0, 100),
    FlSpot(2, 70),
    FlSpot(4, 200),
    FlSpot(6, 400),
    FlSpot(8, 500),
    FlSpot(10, 550),
    FlSpot(12, 700),
    FlSpot(14, 860),
    FlSpot(16, 700),
    FlSpot(18, 600),
    FlSpot(20, 400),
    FlSpot(22, 200),
    FlSpot(23, 150),
  ],

  /// wednesday
  [
    FlSpot(0, 70),
    FlSpot(2, 100),
    FlSpot(4, 200),
    FlSpot(6, 400),
    FlSpot(8, 300),
    FlSpot(10, 700),
    FlSpot(12, 600),
    FlSpot(14, 850),
    FlSpot(16, 800),
    FlSpot(18, 750),
    FlSpot(20, 500),
    FlSpot(22, 100),
    FlSpot(23, 150),
  ],

  /// thursday
  [
    FlSpot(0, 70),
    FlSpot(2, 100),
    FlSpot(4, 200),
    FlSpot(6, 400),
    FlSpot(8, 500),
    FlSpot(10, 700),
    FlSpot(12, 700),
    FlSpot(14, 850),
    FlSpot(16, 800),
    FlSpot(18, 750),
    FlSpot(20, 300),
    FlSpot(22, 100),
    FlSpot(23, 150),
  ],

  /// friday
  [
    FlSpot(0, 70),
    FlSpot(2, 100),
    FlSpot(4, 250),
    FlSpot(6, 440),
    FlSpot(8, 300),
    FlSpot(10, 700),
    FlSpot(12, 600),
    FlSpot(14, 750),
    FlSpot(16, 800),
    FlSpot(18, 750),
    FlSpot(20, 400),
    FlSpot(22, 100),
    FlSpot(23, 150),
  ],

  /// saturday
  [
    FlSpot(0, 70),
    FlSpot(2, 100),
    FlSpot(4, 200),
    FlSpot(6, 400),
    FlSpot(8, 300),
    FlSpot(10, 300),
    FlSpot(12, 500),
    FlSpot(14, 650),
    FlSpot(16, 300),
    FlSpot(18, 250),
    FlSpot(20, 100),
    FlSpot(22, 100),
    FlSpot(23, 150),
  ],

  /// sunday
  [
    FlSpot(0, 70),
    FlSpot(2, 100),
    FlSpot(4, 200),
    FlSpot(6, 400),
    FlSpot(8, 300),
    FlSpot(10, 300),
    FlSpot(12, 200),
    FlSpot(14, 150),
    FlSpot(16, 300),
    FlSpot(18, 250),
    FlSpot(20, 100),
    FlSpot(22, 200),
    FlSpot(23, 50),
  ],
];

// BarChartGroupData occupancyGroupData(
//   int x,
//   double y, {
//   List<int> showTooltips = const [],
// }) {
//   return BarChartGroupData(
//     x: x,
//     barRods: [
//       BarChartRodData(
//         y: y,
//         colors: [const Color(0xFF85C8F9)],
//         width: 22,
//         // borderSide: BorderSide(color: Colors.white, width: 0),
//         backDrawRodData: BackgroundBarChartRodData(
//           show: true,
//           y: 100,
//           colors: [const Color(0xFFCBD4DC)],
//         ),
//       ),
//     ],
//     showingTooltipIndicators: showTooltips,
//   );
// }

// List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
//       switch (i) {
//         case 0:
//           return occupancyGroupData(0, 50.0);
//         case 1:
//           return occupancyGroupData(1, 0.0);
//         case 2:
//           return occupancyGroupData(2, 70.0);
//         case 3:
//           return occupancyGroupData(3, 20.0);
//         case 4:
//           return occupancyGroupData(4, 30.0);
//         case 5:
//           return occupancyGroupData(5, 40.0);
//         case 6:
//           return occupancyGroupData(6, 10.0);
//         default:
//           return throw Error();
//       }
//     });

// BarChartData barData() {
//   return BarChartData(
//     maxY: 100, // maximum of y
//     minY: 0, // minimum of y
//     borderData: FlBorderData(show: false), // remove border
//     gridData: FlGridData(show: false), // remove grid
//     titlesData: FlTitlesData(
//       show: true,
//       rightTitles: SideTitles(showTitles: false),
//       leftTitles: SideTitles(showTitles: false),
//       topTitles: SideTitles(showTitles: false),
//       bottomTitles: SideTitles(
//         showTitles: true,
//         getTextStyles: (context, value) => const TextStyle(
//             color: Color(0xFF343A40),
//             fontWeight: FontWeight.bold,
//             fontSize: 14),
//         margin: 7,
//         getTitles: (double value) {
//           switch (value.toInt()) {
//             case 0:
//               return 'M';
//             case 1:
//               return 'T';
//             case 2:
//               return 'W';
//             case 3:
//               return 'T';
//             case 4:
//               return 'F';
//             case 5:
//               return 'S';
//             case 6:
//               return 'S';
//             default:
//               return '';
//           }
//         },
//       ),
//     ),
//     barGroups: showingGroups(),
//   );
// }
