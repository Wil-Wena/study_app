import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/data_mixin.dart';

const Color darkColor = Color.fromARGB(255, 52, 49, 190);
const Color darkColor2 = Color.fromARGB(184, 35, 12, 73);
const Color mainTextColorDark = Colors.white;

class DarkTheme with subThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData sysDarkTheme = ThemeData.dark();

    return sysDarkTheme.copyWith(
        iconTheme: getIconTheme(), textTheme: getTextTheme()
        // .apply(bodyColor: mainTextColorDark, displayColor: mainTextColorDark),
        );
  }
}
