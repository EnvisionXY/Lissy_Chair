import 'package:flutter/material.dart';

class AppTypography {
  // Headings (Bebas Neue)
  static const TextStyle h1 = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 48,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
  );

  // Paragraphs (Old Standard TT)
  static const TextStyle p1Regular = TextStyle(
    fontFamily: 'OldStandardTT',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle p2Italic = TextStyle(
    fontFamily: 'OldStandardTT',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle p3Bold = TextStyle(
    fontFamily: 'OldStandardTT',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
