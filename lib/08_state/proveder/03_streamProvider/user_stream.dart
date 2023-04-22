import 'package:ufo/08_state/proveder/03_streamProvider/user_model3.dart';
import 'package:ufo/12_log/02_log.dart';

class UserStream {
  var log = MyselfPrinter.logger(UserStream);

  Stream<UserModel3> getStreamUserModel() {
    log.i(UserStream);
    return Stream<UserModel3>.periodic(
      const Duration(milliseconds: 1000),
      (value) => UserModel3(name: "$value"),
    ).take(10);
  }
}
