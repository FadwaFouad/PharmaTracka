import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  get getCurrentIndex => _currentIndex;
}
