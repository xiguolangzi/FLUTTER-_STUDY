import 'package:ufo/12_log/02_log.dart';

class UserModel3 {
  var log = MyselfPrinter.logger(UserModel3);
  String name;

  UserModel3({this.name = "Jimi"});

  void changeName() {
    name = "hello";
    log.i("来自 - usermodel3 - $name");
  }
}
