import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pnet/pages/settings_page.dart';
import 'package:pnet/pages/history_page.dart';
import 'package:pnet/pages/loans_page.dart';
import 'package:pnet/pages/overview_page.dart';
import 'package:pnet/theme.dart';

import 'prices_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  static const List<_BottomBarPage> widgetOptions = [
    _BottomBarPage(InvestPage(), Icons.show_chart, "Prices"),
    _BottomBarPage(WalletLoans(), Icons.attach_money, "Loans"),
    _BottomBarPage(WalletHistory(), Icons.history, "History"),
    _BottomBarPage(SettingsPage(), Icons.settings, "Settings")
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = MyHomePage.widgetOptions.length;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
        extendBody: true,
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onItemTapped(MyHomePage.widgetOptions.length);
          },
          heroTag: null,
          backgroundColor: Colors.green,
          child: const Icon(Icons.home),
        ),
        body: _selectedIndex == MyHomePage.widgetOptions.length
            ? const OverviewPage()
            : MyHomePage.widgetOptions.elementAt(_selectedIndex).page,
        bottomNavigationBar: _BottomBar(parent: this),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final _MyHomePageState parent;

  const _BottomBar({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = _generateButtons();
    children.insert(children.length >> 1, _generateMiddleItem());

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: const Color(0xff232323),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget _generateMiddleItem() {
    int index = MyHomePage.widgetOptions.length;
    bool selected = parent._selectedIndex == index;
    Color color = selected ? Colors.green : Colors.white;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 26.0),
        Text(
          "Home",
          style: TextStyle(color: color, fontSize: 11),
        ),
      ],
    );
  }

  List<Widget> _generateButtons() {
    List<Widget> buttons = List.generate(
        MyHomePage.widgetOptions.length, (index) => _generateButton(index));
    return buttons;
  }

  TextButton _generateButton(int index) {
    bool selected = parent._selectedIndex == index;
    _BottomBarPage page = MyHomePage.widgetOptions.elementAt(index);
    Color color = selected ? Colors.green : Colors.white;
    return TextButton(
        onPressed: () {
          parent._onItemTapped(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconTheme(
              child: Icon(page.icon),
              data: IconThemeData(color: color),
            ),
            Text(
              page.tooltip,
              style: TextStyle(color: color, fontSize: 11),
            ),
          ],
        ));
  }
}

class _BottomBarPage {
  final StatefulWidget _page;
  final IconData _icon;
  final String _tooltip;

  const _BottomBarPage(this._page, this._icon, this._tooltip);

  get icon => _icon;

  get page => _page;

  get tooltip => _tooltip;
}
