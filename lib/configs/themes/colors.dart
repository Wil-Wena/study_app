import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_app/configs/themes/dark_theme.dart';
import 'package:study_app/configs/themes/light_theme.dart';
import 'package:study_app/configs/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [lightColor, lightColor2]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [darkColor, darkColor2]);

LinearGradient mainGradient(BuildContext context) =>
    UiParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
