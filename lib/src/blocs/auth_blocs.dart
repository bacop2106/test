import 'dart:async';

import '../validators/signupvalidations.dart';



class AuthBloc {
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  
  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  
  bool isValid(String email, String password, String name, String phone) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Nhập tên của bạn");
      return false;
    }
    _nameController.sink.add("ok");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Số điện thoại không hợp lệ");
      return false;
    }
    _phoneController.sink.add("ok");

    if (email == null || email.contains("@")) {
      _emailController.sink.addError("Email không hợp lệ ");
      return false;
    }
    _emailController.sink.add("ok");

    if (password == null || password.length <= 6) {
      _passwordController.sink.addError("mật khẩu không hợp lệ");
      return false;
    }
    _passwordController.sink.add("ok");
    return true;
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
    _phoneController.close();
  }
  
}