import 'package:flutter/material.dart';
import 'package:pnet/screens/wallet_history.dart';
import 'package:pnet/screens/wallet_loans.dart';
import 'package:pnet/screens/wallet_overview.dart';
import 'package:pnet/theme.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: const Color(0xff232323),
          centerTitle: true,
          title: const Text(
            "0x182d70cf",
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "History",
              ),
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Loans",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WalletHistory(),
            WalletOverview(),
            WalletLoans(),
          ],
        ),
      ),
    );
  }
}
