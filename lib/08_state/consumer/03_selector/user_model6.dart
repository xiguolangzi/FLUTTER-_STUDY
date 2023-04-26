import 'package:flutter/material.dart';

class UserModel6 extends ChangeNotifier {
  late int age = 10;
  late String name = "Jimi";
  late String phone = "15518509821";

  void chaneAge() {
    age++;
    notifyListeners();
  }
}
