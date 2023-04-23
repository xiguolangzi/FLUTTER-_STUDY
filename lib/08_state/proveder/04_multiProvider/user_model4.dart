import 'package:flutter/material.dart';

class UserModel4 extends ChangeNotifier {
  String name = "Jimi";
  int age = 18;

  void changeName() {
    name = "good";
    age = 30;

    notifyListeners();
  }
}
