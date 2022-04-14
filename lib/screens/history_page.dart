import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pnet/theme.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({Key? key}) : super(key: key);

  @override
  _WalletHistoryState createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: () {},
                color: Colors.white54,
                iconSize: 25.0,
                icon: const Icon(Icons.search)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                const Text(
                  "March 30, 2022",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(height: 16),
                _Transactions(),
                const SizedBox(height: 16),
                const Text(
                  "March 29, 2022",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(height: 16),
                _Transactions(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Transactions extends StatelessWidget {
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
          children: const [
            _CryptoWidget(
                type: "Send",
                crypto: "BNB",
                total: 779.7113999999,
                change: -2.34,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Send",
                crypto: "BNB",
                total: 43.321200000000005,
                change: -0.13,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Trade",
                crypto: "Eth",
                total: 1757.7320000000002,
                change: 0.68,
                account: "0x18af9064",
                exchanged: 17.43,
                exchangedCrypto: "LTC"),
            _CryptoWidget(
                type: "Receive",
                crypto: "Doge",
                total: 1357.88,
                change: 12478.34,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Trade",
                crypto: "BTC",
                total: 11494.336000000001,
                change: 0.32,
                account: "0x18af9064",
                exchanged: 5009.85,
                exchangedCrypto: "EOS"),
            _CryptoWidget(
                type: "Send",
                crypto: "BNB",
                total: 309.69,
                change: -1.23,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Receive",
                crypto: "BNB",
                total: 43.321200000000005,
                change: 0.13,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Trade",
                crypto: "Eth",
                total: 508.24,
                change: 0.31,
                account: "0x18af9064",
                exchanged: 7.68,
                exchangedCrypto: "LTC"),
            _CryptoWidget(
                type: "Receive",
                crypto: "Doge",
                total: 13.56,
                change: 114.78,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Trade",
                crypto: "BTC",
                total: 11494.336000000001,
                change: 0.32,
                account: "0x18af9064",
                exchanged: 5009.85,
                exchangedCrypto: "EOS"),
            _CryptoWidget(
                type: "Send",
                crypto: "BNB",
                total: 779.7113999999,
                change: -2.34,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            _CryptoWidget(
                type: "Send",
                crypto: "BNB",
                total: 43.321200000000005,
                change: -0.13,
                account: "0x18af9064",
                exchanged: 0,
                exchangedCrypto: ""),
            SizedBox(height: 16),
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
    required this.crypto,
    required this.total,
    required this.change,
    required this.account,
    required this.exchanged,
    required this.exchangedCrypto,
  }) : super(key: key);

  final String type;
  final String crypto;
  final double total;
  final double change;
  final String account;
  final double exchanged;
  final String exchangedCrypto;

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      locale: "en_UK",
      name: "GBP",
      symbol: "£",
    );
    return Row(
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
                  exchangedCrypto.isNotEmpty
                      ? exchanged.toString() + " " + exchangedCrypto
                      : account,
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
                change.toString() + " " + crypto.toUpperCase(),
                style: TextStyle(
                  color: change.isNegative ? Colors.red : Colors.green,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              Text(
                currencyFormat.format(total),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
