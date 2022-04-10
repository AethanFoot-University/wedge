import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pnet/screens/asset_screen.dart';

import '../theme.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: [
          _LineChart(),
          const SizedBox(height: 20),
          const Text(
            "Assets",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 16),
          _Assets(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _LineChart extends StatefulWidget {
  static final assetValues = [
    5.0,
    6.0,
    4.0,
    7.0,
    8.0,
    5.0,
    6.0,
    5.0,
    4.0,
    5.0,
    5.5
  ];

  static final depositValues = [
    5.0,
    5.0,
    5.0,
    5.0,
    5.0,
    5.0,
    5.0,
    5.0,
    5.0,
    5.0,
    5.0
  ];

  @override
  State<StatefulWidget> createState() => _LineChartState();
}

class _LineChartState extends State<_LineChart> {
  int touchedIndex = -1;

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
              "£13,298.73",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
            const Text(
              "8.97% (£1,192.90) Change",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: LineChart(data)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  LineChartData get data => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 10,
        maxY: 10,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        enabled: true,
        handleBuiltInTouches: false,
        touchCallback: (event, response) {
          if (!event.isInterestedForInteractions ||
              response == null ||
              response.lineBarSpots == null) {
            setState(() {
              touchedIndex = -1;
            });
            return;
          }
          setState(() {
            touchedIndex = response.lineBarSpots![0].x.toInt();
          });
        },
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: false,
      );

  List<LineChartBarData> get lineBarsData => [
    lineChartBarDataDeposit,
    lineChartBarDataAsset,
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

  LineChartBarData get lineChartBarDataAsset => LineChartBarData(
        isCurved: true,
        color: const Color(0xff4af699),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              return spot.x == touchedIndex;
            }),
        belowBarData: BarAreaData(show: false),
        spots: generateSpots(_LineChart.assetValues),
      );

  LineChartBarData get lineChartBarDataDeposit => LineChartBarData(
        isCurved: true,
        color: Colors.purple,
        barWidth: 2,
        isStrokeCapRound: true,
        dashArray: [2, 4],
        dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              return spot.x == touchedIndex;
            }),
        belowBarData: BarAreaData(show: false),
        spots: generateSpots(_LineChart.depositValues),
      );

  List<FlSpot> generateSpots(List<double> values) {
    return values.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();
  }
}

class _Assets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Wallet",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 18.0),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                        Text(
                          "£13,298.73",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 8.0, 0.0),
                  child: Text(
                    "5",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const _CryptoWidget(
                type: "Titano",
                balance: 5623.56,
                total: 41599.87,
                change: 2.34),
            const _CryptoWidget(
                type: "Ethereum",
                balance: 2586.34,
                total: 0.9990034455,
                change: 4.25),
            const _CryptoWidget(
                type: "Terra",
                balance: 1694.81,
                total: 20.8720443349,
                change: -0.84),
            const _CryptoWidget(
                type: "Dogecoin",
                balance: 1357.88,
                total: 12478.3355847783,
                change: 20.65),
            const _CryptoWidget(
                type: "Bitcoin",
                balance: 1067.72,
                total: 0.0297148436,
                change: 1.23),
            const _CryptoWidget(
                type: "BNB",
                balance: 968.42,
                total: 2.9056377329,
                change: 5.68),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _CryptoWidget extends StatelessWidget {
  const _CryptoWidget({
    Key? key,
    required this.type,
    required this.balance,
    required this.total,
    required this.change,
  }) : super(key: key);

  final String type;
  final double balance;
  final double total;
  final double change;

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      locale: "en_UK",
      name: "GBP",
      symbol: "£",
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(() => const AssetOverview()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Text(
                    total.toString() + " " + type.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
            child: Column(
              children: [
                Text(
                  currencyFormat.format(balance),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                Text(
                  "${change.toString()}%",
                  style: TextStyle(
                    color: change.isNegative ? Colors.red : Colors.green,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
