import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeData currentTheme;

  //Aquí inicializo el currentTheme
  ThemeProvider({
    required bool isDakmode
  }): currentTheme = isDakmode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

}