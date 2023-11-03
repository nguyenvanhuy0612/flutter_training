import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  bool _loginError = false;

  bool get loginError => _loginError;

  void setLoginError(bool value) {
    _loginError = value;
    notifyListeners();
  }
}
