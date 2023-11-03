import 'package:flutter/material.dart';
import 'user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [
    User('huy', 'huy'),
    User('huy1', '123'),
  ]; // List to store registered users
  User? _currentUser;

  List<User> get users => _users;

  User? get currentUser => _currentUser;

  String? loginUser(String username, String password) {
    final user = _users.firstWhere((user) => user.username == username,
        orElse: () => User('', ''));

    if (user.password == password) {
      _currentUser = user;
      notifyListeners();
      return null; // Return null if login is successful
    } else {
      return 'Invalid credentials';
    }
  }

  String? registerUser(String username, String password) {
    // Check if the username is already taken
    if (_users.any((user) => user.username == username)) {
      return 'Username is already taken';
    }

    // Add the new user
    _users.add(User(username, password));
    notifyListeners();
    return null; // Return null if registration is successful
  }

  void changePassword(String username, String newPassword) {
    final userIndex = _users.indexWhere((user) => user.username == username);
    if (userIndex != -1) {
      _users[userIndex] = User(username, newPassword);
      notifyListeners();
    }
  }
}
