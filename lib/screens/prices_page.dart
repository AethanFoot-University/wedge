import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pnet/theme.dart';

class InvestPage extends StatefulWidget {
  const InvestPage({Key? key}) : super(key: key);

  @override
  _InvestPageState createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: const [
          _CryptoWidget(
              name: "Bitcoin",
              shorName: "BTC",
              logo:
                  "https://logo-logos.com/wp-content/uploads/2018/02/bitcoin_4.png",
              value: 35600.23,
              change: 1.74),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "Ethereum",
              shorName: "ETH",
              logo: "https://clipground.com/images/ethereum-png-12.png",
              value: 2673.72,
              change: 1.44),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "Tether",
              shorName: "USDT",
              logo:
                  "https://www.coinopsy.com/media/img/quality_logo/tether-usdt.png",
              value: 0.76,
              change: 0.00),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "BNB",
              shorName: "BNB",
              logo:
                  "http://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Binance-Coin-BNB-icon.png",
              value: 348.56,
              change: 3.34),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "USD Coin",
              shorName: "USDC",
              logo: "https://cryptologos.cc/logos/usd-coin-usdc-logo.png",
              value: 0.76,
              change: 0.04),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "Solana",
              shorName: "SOL",
              logo: "https://cryptologos.cc/logos/solana-sol-logo.png",
              value: 103.23,
              change: 1.92),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "Terra",
              shorName: "LUNA",
              logo:
                  "https://webhaga.com/wp-content/uploads/2020/11/luna1557227471663.png",
              value: 89.93,
              change: 6.64),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "Cardano",
              shorName: "ADA",
              logo: "https://flyingatom.shop/img/cms/Naklejki/2.png",
              value: 0.92,
              change: 0.23),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "XRP",
              shorName: "XRP",
              logo:
                  "https://www.cryptovantage.com/app/uploads/2020/03/xrp-xrp-logo-1.png",
              value: 0.63,
              change: 0.27),
          SizedBox(height: 10),
          _CryptoWidget(
              name: "HEX",
              shorName: "HEX",
              logo: "https://cryptologos.cc/logos/hex-hex-logo.png",
              value: 0.11,
              change: -2.09),
          SizedBox(height: 55.0),
        ],
      ),
    );
  }
}

class _CryptoWidget extends StatelessWidget {
  const _CryptoWidget({
    Key? key,
    required this.name,
    required this.shorName,
    required this.logo,
    required this.value,
    required this.change,
  }) : super(key: key);

  final String name;
  final String shorName;
  final String logo;
  final double value;
  final double change;

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
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: ThemeColours.SECONDARY_BACKGROUND_COLOR,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.network(logo),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Text(
                    shorName,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  currencyFormat.format(value),
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
          ],
        ),
      ),
    );
  }
}
