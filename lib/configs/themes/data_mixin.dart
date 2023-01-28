import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_app/configs/themes/colors.dart';

mixin subThemeData {
  getTextTheme() {
    GoogleFonts.quicksandTextTheme(
      const TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(fontWeight: FontWeight.w400)),
    );
  }

  getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor, size: 15);
  }
}
