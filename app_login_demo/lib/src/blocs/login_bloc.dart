import 'dart:async';

import 'package:app_login_demo/src/validators/validation.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String _user, String _pass) {
    if (!validation.isValidUser(_user)) {
      _userController.sink.addError('Tai khoan khong hop le.');
      return false;
    }

    _userController.sink.add('OK');

    if (!validation.isValidPass(_pass)) {
      _passController.sink.addError('Password khong hop le.');
      return false;
    }

    _passController.sink.add('OK');

    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
