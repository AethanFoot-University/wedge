import 'package:flutter/material.dart';

class ThemeColours{
  static Color _hex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
  static Color TEXT_PRIMARY_COLOUR = Colors.white;
  static Color TEXT_SECONDARY_COLOUR = Colors.grey;
  static Color TEXT_TERNARY_COLOUR = _hex("#C8C8C8");

  static Color PRIMARY_BACKGROUND_COLOR = _hex("#121212");
  static Color SECONDARY_BACKGROUND_COLOR = _hex("#303030");

  static Color PRIMARY_BUTTON_BACKGROUND = Colors.white;
  static Color SECONDARY_BUTTON_BACKGROUND = _hex("#0C0C0C");

  static Color SIDE_BAR_COLOUR = _hex("#383838");
}
