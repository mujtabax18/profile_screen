import 'package:flutter/material.dart';
import 'package:profile_screen/Widgets/appbarwidget.dart';
import 'package:profile_screen/Widgets/SampleChart.dart';
import 'package:profile_screen/Widgets/customdoughnutchart.dart';
import 'package:profile_screen/model/doughnutchartmodel.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          AppBarWidgets(
            backFunctionButtonAction: () {},
            editFunctionButtonAction: () {},
            showedit: false,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text('Performance',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          StatusShowWidget(
            ads: '12',
            streak: '2 days',
            neutrality: '0.041',
            bias: 'Unbiased',
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AssetBox(
                  assetImage: 'images/Teardrop_earring-2.png',
                ),
                AssetBox(
                  assetImage: 'images/Teardrop_earring-3.png',
                ),
                AssetBox(
                  assetImage: 'images/Teardrop_earring-5.png',
                ),
                AssetBox(
                  assetImage: '',
                ),
              ],
            ),
          ),
          Doughnut_test(
            chartData: [
              DoughnutChartData('Like', 5, Colors.green),
              DoughnutChartData('SuperDislike', 3, Colors.red),
              DoughnutChartData('SuperLike', 2, Colors.blue),
              DoughnutChartData('Disklike', 2, Colors.orange),
            ],
          ),
        ],
      ),
    ));
  }
}

class AssetBox extends StatelessWidget {
  const AssetBox({
    this.assetImage: '',
    super.key,
  });
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 5),
      ),
      child: SizedBox(
          height: 70,
          width: 70,
          child: assetImage == ''
              ? Icon(
                  Icons.question_mark,
                  size: 70,
                )
              : Image.asset(
                  assetImage,
                )),
    );
  }
}

class StatusShowWidget extends StatelessWidget {
  const StatusShowWidget({
    required this.ads,
    required this.streak,
    required this.neutrality,
    required this.bias,
    super.key,
  });
  final String ads;
  final String streak;
  final String neutrality;
  final String bias;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              StatusInnerWidget(
                value: ads,
                name: 'Ads Reviewed',
              ),
              StatusInnerWidget(
                value: neutrality,
                name: 'Neutrality',
                bgColor: Colors.blue,
                txtColor: Colors.white,
              ),
            ],
          ),
          Column(
            children: [
              StatusInnerWidget(
                value: streak,
                name: 'Longest Streak',
                bgColor: Colors.blue,
                txtColor: Colors.white,
              ),
              StatusInnerWidget(
                value: bias,
                name: 'Bias Class',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusInnerWidget extends StatelessWidget {
  const StatusInnerWidget({
    required this.value,
    required this.name,
    this.bgColor: Colors.white,
    this.borderColor: Colors.blue,
    this.txtColor: Colors.blue,
    this.nameFontSize: 20,
    this.valueFontSize: 30,
    super.key,
  });
  final String value;
  final String name;
  final Color txtColor;
  final Color bgColor;
  final Color borderColor;
  final double valueFontSize;
  final double nameFontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: FontWeight.bold,
              color: txtColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: nameFontSize,
              fontWeight: FontWeight.normal,
              color: txtColor,
            ),
          ),
        ],
      ),
    );
  }
}
