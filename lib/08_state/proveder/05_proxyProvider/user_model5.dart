import 'package:flutter/material.dart';

class UserModel5 extends ChangeNotifier {
  String name = "Jimi";

  UserModel5();

  void changeName({required String newName}) {
    name = newName;
    notifyListeners();
  }
}
