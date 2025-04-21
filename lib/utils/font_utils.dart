import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtils {
  static TextStyle safeFontStyle({
    String? fontFamily,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize,
    Color? color,
  }) {
    try {
      // Attempt to load Google Font with comprehensive fallback
      return GoogleFonts.getFont(
        fontFamily ?? 'Poppins',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );
    } catch (e) {
      // Comprehensive error logging and fallback
      print('Font loading error for $fontFamily: $e');
      return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );
    }
  }

  // Offline-first font loading method
  static TextStyle offlineFriendlyTextStyle({
    String? googleFontName,
    String? localFontName = 'Poppins',
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) {
    try {
      // Prioritize local font if available
      if (localFontName != null) {
        return TextStyle(
          fontFamily: localFontName,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        );
      }

      // Fallback to Google Fonts with error handling
      return safeFontStyle(
        fontFamily: googleFontName ?? 'Poppins',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );
    } catch (e) {
      print('Offline font loading failed: $e');
      return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );
    }
  }
}
