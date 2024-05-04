import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier {
  int _tasbihCounter = 0;
  int get tasbihCounter => _tasbihCounter;

  void addTasbihCounter() {
    _tasbihCounter = _tasbihCounter + 1;
    notifyListeners();
  }

  void refreshTasbih() {
    _tasbihCounter = 0;
    notifyListeners();
  }
}
