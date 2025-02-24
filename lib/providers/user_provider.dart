import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  model.User? _user;

  final _authMethod = AuthMethods();

  model.User? get getUser => _user;
  Future<void> refreshUser() async {
    model.User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
