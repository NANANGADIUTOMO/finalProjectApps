import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'omset.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class data extends StatefulWidget {
  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  final Stream<QuerySnapshot> invoice =
      FirebaseFirestore.instance.collection('invoice').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: StreamBuilder<QuerySnapshot>(
            stream: invoice,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("ada yang salah");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("loading");
              }
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text("${data.docs[index]['total']}"),
                        ],
                      )
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}

class ngomsetLine extends StatefulWidget {
  const ngomsetLine({Key? key}) : super(key: key);

  @override
  State<ngomsetLine> createState() => _ngomsetLineState();
}

class _ngomsetLineState extends State<ngomsetLine> {
  final List<Omset> omset = [
    Omset('Minggu 1', 20, 35, 20, 10),
    Omset('Minggu 2', 30, 60, 50, 20),
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
