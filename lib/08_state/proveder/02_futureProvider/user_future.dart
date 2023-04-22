import 'user_model2.dart';
import 'package:ufo/12_log/02_log.dart';

class UserFuture {
  var log = MyselfPrinter.logger(UserFuture);

  Future<UserModel2> asyncGetUserModel2() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    log.i("来自user_future");
    return UserModel2(name: "获取新数据");
  }
}
