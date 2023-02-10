import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SampleChart extends StatefulWidget {
  @override
  _SampleChartState createState() => _SampleChartState();
}

class _SampleChartState extends State<SampleChart> {
  int count = 0;
  double average = 0;
  double normalizedAverage = 0;
  String biasclass = "Unknown";
  int maxConsecutiveDays = 0;
  Map<int, Color> _colors = {
    0: Colors.red,
    25: Colors.orange,
    75: Colors.green,
    100: Colors.blue,
  };

  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<BarChartGroupData> chartData = [
    BarChartGroupData(
      x: 75,
      barRods: [
        BarChartRodData(
          toY: 5.toDouble(),
          color: Colors.green,
          width: 16,
        ),
      ],
    ),
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 3.toDouble(),
          color: Colors.red,
          width: 16,
        ),
      ],
    ),
    BarChartGroupData(
      x: 100,
      barRods: [
        BarChartRodData(
          toY: 2.toDouble(),
          color: Colors.blue,
          width: 16,
        ),
      ],
    ),
    BarChartGroupData(
      x: 25,
      barRods: [
        BarChartRodData(
          toY: 2.toDouble(),
          color: Colors.orange,
          width: 16,
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    // _getDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return ChartWidget(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        chartData: chartData);
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'SuperDislike';
        break;
      case 25:
        text = 'Dislike';
        break;
      case 75:
        text = 'Like';
        break;
      case 100:
        text = 'SuperLike';
        break;
      default:
        text = "";
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.barTouchData,
    required this.titlesData,
    required this.borderData,
    required this.chartData,
  });

  final BarTouchData barTouchData;
  final FlTitlesData titlesData;
  final FlBorderData borderData;
  final List<BarChartGroupData> chartData;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'Like distribution:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 200,
                width: 400,
                child: BarChart(
                  BarChartData(
                    barTouchData: barTouchData,
                    titlesData: titlesData,
                    borderData: borderData,
                    barGroups: chartData,
                    gridData: FlGridData(show: false),
                    alignment: BarChartAlignment.spaceAround,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
