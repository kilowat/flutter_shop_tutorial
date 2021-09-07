import 'package:flutter/material.dart';

class Styles {
  static const fontLemon = "Lemon";
  static const fontLato = "Lato";
  static const colorPrimary = Color(0xFF273773);
  static const colorPrimaryLight = Color(0xFF394177);
  static const colorAccent = Color(0xFF56D5A8);
  static const colorDarkText = Color(0xFF111111);
  static Color colorLightText = Color(0xFF111111).withOpacity(0.5);
  static const colorBackground = Color(0xFFF7F7F7);
  static const paddingDefault = 16.0;
  static const inputFormDecoration = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(8, 24, 12, 4),
    isCollapsed: true,
    labelStyle: TextStyle(
      fontSize: 14,
    ),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  );
}
