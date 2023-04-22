import 'package:flutter/material.dart';

// 1.建立构造模型
class UserModel1 extends ChangeNotifier {
  String name = "Jimi";

  void changeName() {
    name = "hello";

    // 2.通知子组件的消费者
    notifyListeners();
  }

  void changeName2() {
    name = "world";

    // 2.通知子组件的消费者
    notifyListeners();
  }
}
