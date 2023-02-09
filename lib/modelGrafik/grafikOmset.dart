import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'omset.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ngomsetLine extends StatefulWidget {
  const ngomsetLine({Key? key}) : super(key: key);

  @override
  State<ngomsetLine> createState() => _ngomsetLineState();
}

class _ngomsetLineState extends State<ngomsetLine> {
  final List<Omset> omset = [
    Omset('Oktober 22', 20, 35, 20, 10),
    Omset('November 22', 30, 60, 50, 20),
    Omset('Desember 22', 10, 10, 30, 50),
    Omset('Januari 23', 50, 20, 20, 90),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            StackedColumnSeries<Omset, String>(
                dataSource: omset,
                xValueMapper: (Omset ch, _) => ch.x,
                yValueMapper: (Omset ch, _) => ch.y1),
            StackedColumnSeries<Omset, String>(
                dataSource: omset,
                xValueMapper: (Omset ch, _) => ch.x,
                yValueMapper: (Omset ch, _) => ch.y2),
            StackedColumnSeries<Omset, String>(
                dataSource: omset,
                xValueMapper: (Omset ch, _) => ch.x,
                yValueMapper: (Omset ch, _) => ch.y3),
            StackedColumnSeries<Omset, String>(
                dataSource: omset,
                xValueMapper: (Omset ch, _) => ch.x,
                yValueMapper: (Omset ch, _) => ch.y4)
          ],
        ),
      ),
    );
  }
}
