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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: Colors.green,
        child: const Icon(Icons.search),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: const [
          SizedBox(height: 20),
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
            collateral: 5,
          ),
          SizedBox(height: 16),
          _Loan(
            urgency: Colors.orange,
            amount: 500,
            platform: "Nexo",
            date: "14/08/2022",
            minimumPayment: 20,
            collateral: 10,
          ),
          SizedBox(height: 16),
          _Loan(
            urgency: Colors.green,
            amount: 4000,
            platform: "Nexo",
            date: "18/01/2023",
            minimumPayment: 150,
            collateral: 10,
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
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
              child: Text(
                "Amount: " +
                    currencyFormat.format(amount) +
                    "\n" +
                    "Date Due: " +
                    date +
                    "\n"
                        "Minimum Payment: " +
                    currencyFormat.format(minimumPayment) +
                    "\n"
                        "Collateral: " +
                    collateral.toString() +
                    "%\n",
                style: const TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
