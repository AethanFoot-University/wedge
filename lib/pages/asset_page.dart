import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pnet/pages/similar_products_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              children: [
                _LineChart(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          Navigator.of(context).push(
                              _createRoute(() => const SimilarProductsPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                "Similar Products",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Icon(
                                Icons.arrow_circle_up,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: _launchURL,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                "Discord",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Icon(
                                Icons.arrow_circle_up,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                _Assets(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.white54,
                iconSize: 25.0,
                icon: const Icon(Icons.arrow_back_rounded)),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    Uri url = Uri.parse("https://discord.com/invite/xxdS792B7q");
    if (!await launchUrl(url)) throw 'Could not launch $url';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
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
                  infoRow("Average Cost", "£0.1458", null),
                  const SizedBox(height: 16),
                  infoRow("Paid Fees", "£17.38", null),
                  const SizedBox(height: 16),
                  infoRow("24-Hour Return", "1.47% (£82.67)", null),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Stats",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        const SizedBox(height: 8.0),
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
                ),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        infoRow("Market Cap", "£0.00", null),
                        const SizedBox(height: 20),
                        infoRow("Trading Volume", "£302,267", null),
                        const SizedBox(height: 20),
                        infoRow("Fully Diluted Value", "£561.44M", null),
                        const SizedBox(height: 20),
                        infoRow("1 Year Low", "£0.0094", null),
                        const SizedBox(height: 20),
                        infoRow("1 Year High", "£0.2011", null),
                        const SizedBox(height: 20),
                      ],
                    )))),
        const SizedBox(height: 16),
        const Text(
          "Performance",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        const SizedBox(height: 8.0),
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
                ),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        infoRow("1 Day", "-2.1%", Colors.red),
                        const SizedBox(height: 20),
                        infoRow("1 week", "14.3%", Colors.green),
                        const SizedBox(height: 20),
                        infoRow("1 Month", "2.34%", Colors.green),
                        const SizedBox(height: 20),
                        infoRow("3 Month", "-16.32%", Colors.red),
                        const SizedBox(height: 20),
                        infoRow("1 Year", "43.61%", Colors.green),
                        const SizedBox(height: 20),
                      ],
                    )))),
      ],
    );
  }

  Widget infoRow(String name, String data, Color? color) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
          child: Text(
            data,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}

Route _createRoute(Widget Function() createPage) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
    return createPage();
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    var curve = Curves.ease;
    var curveTween = CurveTween(curve: curve);
    final tween = Tween(begin: begin, end: end).chain(curveTween);
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: SafeArea(
        child: child,
      ),
    );
  });
}
