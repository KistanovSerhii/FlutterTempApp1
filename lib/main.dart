import 'package:flutter/material.dart';
import 'package:smart_chess_board/internal/application.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  //*********************Get last Theme mode********************* +
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  //*********************Get last Theme mode********************* -
  runApp(Application(savedThemeMode: savedThemeMode));
}
