import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils {
  static String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static TextStyle poppins(TextStyle style) =>
      style.copyWith(fontFamily: GoogleFonts.poppins().fontFamily);
}
