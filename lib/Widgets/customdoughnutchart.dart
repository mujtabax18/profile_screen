import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:profile_screen/model/doughnutchartmodel.dart';

class Doughnut_test extends StatefulWidget {
  Doughnut_test({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  List<DoughnutChartData> chartData;
  @override
  State<Doughnut_test> createState() => _Doughnut_testState();
}

class _Doughnut_testState extends State<Doughnut_test> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(20),
      child: Container(
          child: SfCircularChart(
              tooltipBehavior: _tooltipBehavior,
              title: ChartTitle(
                text: 'Like Distribution',
              ),
              legend: Legend(isVisible: true),
              series: <CircularSeries>[
            // Renders doughnut chart
            DoughnutSeries<DoughnutChartData, String>(
                dataSource: widget.chartData,
                pointColorMapper: (DoughnutChartData data, _) => data.color,
                xValueMapper: (DoughnutChartData data, _) => data.x,
                yValueMapper: (DoughnutChartData data, _) => data.y)
          ])),
    );
  }
}
