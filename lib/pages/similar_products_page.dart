import 'package:flutter/material.dart';

import '../theme.dart';

class SimilarProductsPage extends StatefulWidget {
  const SimilarProductsPage({Key? key}) : super(key: key);

  @override
  _SimilarProductsPageState createState() => _SimilarProductsPageState();
}

class _SimilarProductsPageState extends State<SimilarProductsPage> {
  final List<_RiskCard> higher = [
    _RiskCard("ApeCoin", 13.54, "1M"),
    _RiskCard("STEPN", 12.35, "2M"),
    _RiskCard("Ox", 12.13, "4Y"),
    _RiskCard("Monero", 11.68, "7Y"),
  ];

  final List<_RiskCard> similar = [
    _RiskCard("Bitcoin", 8.00, "9Y"),
    _RiskCard("Ethereum", 7.50, "7Y"),
    _RiskCard("Terra", 6.00, "3Y"),
  ];

  final List<_RiskCard> lower = [
    _RiskCard("Tether", 5.00, "7Y"),
    _RiskCard("USD Coin", 5.00, "3Y"),
    _RiskCard("Binance USD", 5.00, "2Y"),
    _RiskCard("Dogecoin", 25.67, "8Y"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
            child: Text(
              "Similar Products",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  "Higher Risk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _RiskSection(cards: higher),
                const SizedBox(height: 16.0),
                const Text(
                  "Similar Risk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _RiskSection(cards: similar),
                const SizedBox(height: 16.0),
                const Text(
                  "Lower Risk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _RiskSection(cards: lower),
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
}

class _RiskSection extends StatelessWidget {
  final List<_RiskCard> cards;

  const _RiskSection({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
              decoration: BoxDecoration(
                color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(width: 80.0),
                        SizedBox(
                          width: 60.0,
                          child: Text(
                            "APY",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                          child: Text(
                            "Age",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 14.0),
                      ],
                    ),
                  ),
                  ...List.generate(cards.length, (index) => _riskCard(index)),
                  const SizedBox(height: 8.0),
                ],
              ))),
    );
  }

  Widget _riskCard(index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80.0,
            child: Text(
              cards[index].name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 60.0,
            child: Text(
              cards[index].apy.toString() + "%",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 30.0,
            child: Text(
              cards[index].age,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 14.0,)
        ],
      ),
    );
  }
}

class _RiskCard {
  final String name;
  final double apy;
  final String age;

  _RiskCard(this.name, this.apy, this.age);
}
