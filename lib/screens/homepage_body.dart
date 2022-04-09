import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pnet/screens/wallet_page.dart';

import '../theme.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(_createRoute(() => const WalletPage()));
            },
            child: _AccountWidget(
              profilePicture: Container(
                decoration: const BoxDecoration(color: Colors.purple),
              ),
              accountHash: "0x182d70cf",
              balance: 13298.73,
              change: 8.97,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(_createRoute(() => const WalletPage()));
            },
            child: _AccountWidget(
              profilePicture: Container(
                decoration: const BoxDecoration(color: Colors.amber),
              ),
              accountHash: "0x1ab56971",
              balance: 68239.39,
              change: -11.54,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountWidget extends StatelessWidget {
  const _AccountWidget({
    Key? key,
    required this.profilePicture,
    required this.accountHash,
    required this.balance,
    required this.change,
  }) : super(key: key);

  final Widget profilePicture;
  final String accountHash;
  final double balance;
  final double change;

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      locale: "en_UK",
      name: "GBP",
      symbol: "£",
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: profilePicture,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 16.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accountHash,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 18.0),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Text(
                        currencyFormat.format(balance),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 8.0, 0.0),
                child: Text(
                  "${change.toString()}%",
                  style: TextStyle(
                    color: change.isNegative ? Colors.red : Colors.green,
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
        ),
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
