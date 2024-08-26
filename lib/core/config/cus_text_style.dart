import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/config/color.dart';

TextStyle cusTextStyle({
  required Color color,
  required double size,
  required int weight,
  double letterSpacing = 0,
  bool underline = false,
  bool italic = false,
  String fontFamily = 'open_sans', // open_sans or source_sans
}) {
  return TextStyle(
    fontSize: size,
    letterSpacing: letterSpacing * 0.15,
    fontWeight: FontWeight.values[(weight ~/ 100) - 1],
    fontFamily: fontFamily,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    color: underline ? CusColor.kTransparent : color,
    decoration: underline ? TextDecoration.underline : TextDecoration.none,
    decorationColor: underline ? color : null,
    decorationThickness: underline ? 2 : null,
    shadows:
        underline ? [Shadow(color: color, offset: const Offset(0, -2))] : null,
  );
}
