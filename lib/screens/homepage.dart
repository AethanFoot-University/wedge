import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pnet/blank_screen.dart';
import 'package:pnet/screens/settings_page.dart';
import 'package:pnet/theme.dart';

import 'homepage_body.dart';
import 'invest_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<_BottomBarPage> _widgetOptions = [
    _BottomBarPage(HomePageBody(), Icon(Icons.home), "Home"),
    _BottomBarPage(InvestPage(), Icon(Icons.show_chart), "Invest"),
    _BottomBarPage(BlankScreen(), Icon(Icons.call_to_action), "Actions"),
    _BottomBarPage(BlankScreen(), Icon(Icons.star), "Favourites"),
    _BottomBarPage(SettingsPage(), Icon(Icons.settings), "Settings")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.PRIMARY_BACKGROUND_COLOR,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex).page,
        ),
      ),
      bottomNavigationBar: BottomBar(parent: this),
    );
  }
}

class BottomBar extends StatelessWidget {
  final _MyHomePageState parent;

  const BottomBar({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
      child: BottomAppBar(
        color: Colors.black,
        child: Ink(
          color: const Color(0xff232323),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _generateButtons(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateButtons(BuildContext context) {
    List<Widget> buttons = List.generate(_MyHomePageState._widgetOptions.length,
        (index) => _generateButton(index));
    return buttons;
  }

  TextButton _generateButton(int index) {
    bool selected = parent._selectedIndex == index;
    _BottomBarPage page = _MyHomePageState._widgetOptions.elementAt(index);
    Color color = selected ? Colors.green : Colors.white;
    return TextButton(
        onPressed: () {
          parent._onItemTapped(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconTheme(
              child: page.icon,
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
  final Icon _icon;
  final String _tooltip;

  const _BottomBarPage(this._page, this._icon, this._tooltip);

  get icon => _icon;

  get page => _page;

  get tooltip => _tooltip;
}
