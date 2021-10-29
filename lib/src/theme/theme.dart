import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData darkThemeData =
      ThemeData.dark().copyWith(accentColor: Colors.tealAccent);

  ThemeData lightThemeData = ThemeData.light();

  ThemeData customThemeData = ThemeData.dark().copyWith(
    accentColor: Color(0xff48A0EB),
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Color(0xff16202B),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.amber,
      ),
    ),
  );

  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = lightThemeData;
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = darkThemeData;
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = customThemeData;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = darkThemeData;
    } else {
      _currentTheme = lightThemeData;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = customThemeData;
    } else {
      _currentTheme = lightThemeData;
    }
    notifyListeners();
  }
}
