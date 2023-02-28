class validation {
  static bool isValidUser(String _user) {
    return _user != null || _user.length > 6 || _user.contains('@');
  }

  static bool isValidPass(String _pass) {
    return _pass != null || _pass.length > 6;
  }
}
