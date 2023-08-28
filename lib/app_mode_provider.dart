import 'package:flutter/material.dart';

class AppModeProvider extends ChangeNotifier {
  String _currentAppMode = "IIT East Region";

  String get currentAppMode => _currentAppMode;

  void changeAppMode(String newAppMode) {
    _currentAppMode = newAppMode;
    notifyListeners();
  }
}
