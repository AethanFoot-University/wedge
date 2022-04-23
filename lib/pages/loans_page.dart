import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pnet/theme.dart';

class WalletLoans extends StatefulWidget {
  const WalletLoans({Key? key}) : super(key: key);

  @override
  _WalletLoansState createState() => _WalletLoansState();
}

class _WalletLoansState extends State<WalletLoans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {},
                color: Colors.white54,
                iconSize: 25.0,
                icon: const Icon(Icons.search)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              children: const [
                Text(
                  "Outstanding Loans",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 16),
                _Loan(
                  urgency: Colors.red,
                  amount: 1500,
                  platform: "Nexo",
                  date: "22/04/2022",
                  minimumPayment: 100,
                  collateral: 45.0,
                ),
                SizedBox(height: 16),
                _Loan(
                  urgency: Colors.red,
                  amount: 100,
                  platform: "Nexo",
                  date: "26/04/2022",
                  minimumPayment: 10,
                  collateral: 45.0,
                ),
                SizedBox(height: 16),
                _Loan(
                  urgency: Colors.orange,
                  amount: 500,
                  platform: "Nexo",
                  date: "14/08/2022",
                  minimumPayment: 20,
                  collateral: 20.0,
                ),
                SizedBox(height: 16),
                _Loan(
                  urgency: Colors.green,
                  amount: 4000,
                  platform: "Nexo",
                  date: "18/01/2023",
                  minimumPayment: 150,
                  collateral: 5.0,
                ),
                SizedBox(height: 16),
                _Loan(
                  urgency: Colors.green,
                  amount: 1000,
                  platform: "Nexo",
                  date: "28/02/2023",
                  minimumPayment: 100,
                  collateral: 5.0,
                ),
                SizedBox(height: 55.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Loan extends StatelessWidget {
  const _Loan({
    Key? key,
    required this.urgency,
    required this.amount,
    required this.platform,
    required this.date,
    required this.minimumPayment,
    required this.collateral,
  }) : super(key: key);

  final Color urgency;
  final double amount;
  final String platform;
  final String date;
  final double minimumPayment;
  final double collateral;

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      locale: "en_UK",
      name: "GBP",
      symbol: "£",
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Container(
                        decoration: BoxDecoration(color: urgency),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    platform,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Column(
                children: [
                  formatRow("Amount", currencyFormat.format(amount)),
                  const SizedBox(height: 4),
                  formatRow("Date Due", date),
                  const SizedBox(height: 4),
                  formatRow(
                      "Minimum Payment", currencyFormat.format(minimumPayment)),
                  const SizedBox(height: 4),
                  formatRow("Collateral", collateral.toString() + "%"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row formatRow(String heading, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
