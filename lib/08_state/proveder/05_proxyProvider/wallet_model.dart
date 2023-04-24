import 'user_model5.dart';

class WalletModel {
  UserModel5 models;

  WalletModel({required this.models});

  void changeName() {
    models.changeName(newName: "JIMI");
  }
}
