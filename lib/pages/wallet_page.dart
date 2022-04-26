import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              barrierColor: Colors.white24,
              builder: (BuildContext context) => _ConnectWalletDialog());
        },
        heroTag: "walletPage",
        backgroundColor: Colors.green,
        label: const Text(
          "Add",
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _AccountWidget(
                  profilePicture: Container(
                    decoration: const BoxDecoration(color: Colors.purple),
                  ),
                  accountHash: "0x182d70cf",
                  balance: 2762.53,
                  change: 8.97,
                ),
                _AccountWidget(
                  profilePicture: Container(
                    decoration: const BoxDecoration(color: Colors.amber),
                  ),
                  accountHash: "0x1ab56971",
                  balance: 2586.34,
                  change: -11.54,
                ),
                _AccountWidget(
                  profilePicture: Container(
                    decoration: const BoxDecoration(color: Colors.orange),
                  ),
                  accountHash: "0x1ab563490",
                  balance: 5623.56,
                  change: 2.91,
                ),
                _AccountWidget(
                  profilePicture: Container(
                    decoration: const BoxDecoration(color: Colors.cyan),
                  ),
                  accountHash: "0x5dcf3617",
                  balance: 1357.88,
                  change: 0.37,
                ),
                _AccountWidget(
                  profilePicture: Container(
                    decoration: const BoxDecoration(color: Colors.indigo),
                  ),
                  accountHash: "0x90e345fa",
                  balance: 968.42,
                  change: -0.21,
                ),
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

class _ConnectWalletDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
            child: Text(
              "Connect Wallet",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          _ConnectButtons(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text("Close")),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class _ConnectButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _connectButton(
                context,
                "https://cdn.iconscout.com/icon/free/png-512/metamask-2728406-2261817.png",
                null,
                "Metamask"),
            _connectButton(
                context,
                "https://logos-download.com/wp-content/uploads/2018/04/Binance_logo_coin-136x136.png",
                null,
                "Binance Wallet"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _connectButton(
                context,
                "https://lh3.googleusercontent.com/rq5wUrwR5zZKqRQol3IfwOENAKDH51RHrqLS2Mq8ttsN7Nt8DSaib6M7Ng0ZiwtOsoM=w300",
                null,
                "Coinbase Wallet"),
            _connectButton(context, null, Icons.more_horiz, "More"),
          ],
        )
      ],
    );
  }

  Widget _connectButton(
      BuildContext context, String? image, IconData? icon, String name) {
    if (image == null && icon == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 124.0,
          child: Column(
            children: [
              icon == null
                  ? SizedBox(
                      height: 40, width: 40, child: Image.network(image!))
                  : Icon(
                      icon,
                      size: 40,
                      color: Colors.white,
                    ),
              const SizedBox(height: 8.0),
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
