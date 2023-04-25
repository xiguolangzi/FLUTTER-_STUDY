import 'package:flutter/material.dart';

class CountNotifier1 extends ChangeNotifier {
  int count = 0;

  void changeCount() {
    count++;
    notifyListeners();
  }
}
