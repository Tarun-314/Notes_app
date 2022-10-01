import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyle {
  static Color bgColor = Color(0xf5858d7);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.purple.shade300,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,

  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
      fontSize: 18.0, fontWeight: FontWeight.w700);
  static TextStyle mainContent = GoogleFonts.nunito(
      fontSize: 16.0, fontWeight: FontWeight.normal);
  static TextStyle dataTitle = GoogleFonts.roboto(
      fontSize: 13.0, fontWeight: FontWeight.w500);
}