import 'package:flutter/foundation.dart';

import '../models/auth_data.dart';
import '../services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isLoading = false;
  AuthData? authData;
  bool isSigningUp = false;

  Future<void> signUpUser(
      String email, String password, String username) async {
    authData = await _authService.signUpUser(email, password, username);
  }

  Future<AuthData?> signInUser(String email, String password) async {
    authData = await _authService.signInUser(email, password);
    return authData;

  }
}
