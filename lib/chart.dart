// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('1', 78),
      _ChartData('2', 58),
      _ChartData('3', 83),
      _ChartData('4', 100),
      _ChartData('5', 60),
    ];

    _tooltip = TooltipBehavior(enable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: 330,
        width: double.infinity,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          margin: EdgeInsets.all(10),
          isTransposed: false,
          primaryXAxis: CategoryAxis(
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
          ),
          annotations: [
            CartesianChartAnnotation(
              widget: Container(
                child: Column(
                  children: [
                    Text(
                      "YAPI KREDI PORTFOY VONETIMI AS YP2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "YAPI KREDI PORTFOY VONETIMI AS YP2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "YAPI KREDI PORTFOY VONETIMI AS YP2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Text(
                      "YAPI KREDI PORTFOY VONETIMI AS YP2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Text(
                      "YAPI KREDI PORTFOY VONETIMI AS YP2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              x: 140,
              y: 130,
            ),
          ],
          primaryYAxis: NumericAxis(
            labelFormat: '{value}M',
            minimum: 0,
            maximum: 120,
            interval: 20,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(width: 0),
          ),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries<_ChartData, String>>[
            BarSeries<_ChartData, String>(
              pointColorMapper: (_ChartData data, int index) {
                // Specify different colors for each data point
                if (index == 0) {
                  return Color.fromARGB(255, 115, 118, 146);
                } else if (index == 1) {
                  return Colors.black;
                } else if (index == 2) {
                  return Colors.grey;
                } else if (index == 3) {
                  return Colors.blueGrey.shade300;
                } else if (index == 4) {
                  return Colors.black;
                } else {
                  return null;
                }
              },
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              dataLabelSettings: DataLabelSettings(
                isVisible: false,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),

              // isTrackVisible: false,
              width: 0.5,
              spacing: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
