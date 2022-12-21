

import 'dart:async';

import '../validators/validations.dart';

class LoginBloc {
  StreamController _usernameController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get usernameStream => _usernameController.stream;

  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String pass) {
    if (!Validations.isValidUser(username)) {
      _usernameController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _usernameController.sink.add("OK");
    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }

    _passController.sink.add("OK");
    return true;
  }

  void dispose() {
    _usernameController.close();
    _passController.close();
  }
}
