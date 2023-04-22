import 'package:ufo/12_log/02_log.dart';

class UserModel2 {
  String name;

  var log = MyselfPrinter.logger(UserModel2);

  UserModel2({this.name = "Jimi"});

  Future changeName() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    name = "hello";
    log.i("来自usermodel2 - $name");
  }
}
