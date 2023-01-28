import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/data_mixin.dart';

const Color lightColor = Color.fromARGB(255, 42, 173, 180);
const Color lightColor2 = Color.fromARGB(255, 44, 187, 51);

class LighTheme with subThemeData {
  buildDLightTheme() {
    final ThemeData sysLightTheme = ThemeData.light();

    return sysLightTheme.copyWith(iconTheme: getIconTheme());
  }
}
