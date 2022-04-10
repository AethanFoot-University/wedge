import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class AssetOverview extends StatefulWidget {
  const AssetOverview({Key? key}) : super(key: key);

  @override
  _AssetOverviewState createState() => _AssetOverviewState();
}

class _AssetOverviewState extends State<AssetOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        heroTag: "assetOverview",
        backgroundColor: Colors.green,
        label: const Text(
          "Buy",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          _LineChart(),
          const SizedBox(height: 20),
          _Assets(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Titano",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "£0.1355 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  "2.34%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: LineChart(sampleData1)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

LineChartData get sampleData1 => LineChartData(
      lineTouchData: lineTouchData1,
      gridData: gridData,
      titlesData: titlesData1,
      borderData: borderData,
      lineBarsData: lineBarsData1,
      minX: 0,
      maxX: 10,
      maxY: 10,
      minY: 0,
    );

LineTouchData get lineTouchData1 => LineTouchData(
      enabled: false,
    );

FlTitlesData get titlesData1 => FlTitlesData(
      show: false,
    );

List<LineChartBarData> get lineBarsData1 => [
      lineChartBarData1_1,
    ];

FlGridData get gridData => FlGridData(show: false);

FlBorderData get borderData => FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: Color(0xff4e4965), width: 4),
        left: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
      ),
    );

LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      color: const Color(0xff4af699),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(0, 5),
        FlSpot(1, 6),
        FlSpot(2, 4),
        FlSpot(3, 7),
        FlSpot(4, 8),
        FlSpot(5, 5),
        FlSpot(6, 6),
        FlSpot(7, 5),
        FlSpot(8, 4),
        FlSpot(9, 5),
        FlSpot(10, 5.5),
      ],
    );

class _Assets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Equity 42.29%",
                style: TextStyle(color: Colors.white70, fontSize: 18.0),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              const Text(
                "£5623.56",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              const Text(
                "41599.87 TITANO",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Average Cost",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                    child: Text(
                      "£0.1458",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Paid Fees",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                    child: Text(
                      "£17.38",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "24-Hour Return",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                    child: Text(
                      "1.47% (£82.67)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
