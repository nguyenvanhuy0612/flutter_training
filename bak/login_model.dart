import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  String _username = '';
  String _password = '';

  String get username => _username;

  String get password => _password;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }
}
