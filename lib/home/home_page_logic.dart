import 'package:flutter/material.dart';

class HomePageLogic extends ChangeNotifier {
  bool _isSlateTheme = true;
  bool get isSlateTheme => _isSlateTheme;

  void toggleTheme() {
    _isSlateTheme = !_isSlateTheme;
    notifyListeners();
  }
}