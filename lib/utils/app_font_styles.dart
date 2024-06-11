import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  Text S({
    required String text,
    Color color = Colors.black,
    double? height,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.raleway(
        height: height,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  Text N({
    required String text,
    Color color = Colors.black,
    double? height,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.lato(
        height: height,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
