class Validations {
  static bool isValidEmail(String email){
    return email != null && email.length > 6 && email.contains('@');
  }
  static bool isValidPass1(String password){
    return password != null && password.length > 6;
  }
  static bool isValidPhone(String phone){
    return phone != null && phone.length > 8 && phone.length < 12;
  }
  static bool isValidName(String name){
    return name != null && name.length > 5;
  }
}