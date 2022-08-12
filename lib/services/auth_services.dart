import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/auth_data.dart';

class AuthService with ChangeNotifier {
  Future<AuthData?> signUpUser(
      String email, String password, String username) async {
    var res = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAj6NzlMHWwIe01etCM-P4mQ25Yu0Lgetk'),
      body: json.encode({
        'displayName': username,
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    if (res.statusCode == 200) {
      return AuthData.fromJson(json.decode(res.body));
    }
    return null;
  }

  Future<AuthData?> signInUser(String email, String password) async {
    var res = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAj6NzlMHWwIe01etCM-P4mQ25Yu0Lgetk'),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    if (res.statusCode == 200) {
      if (kDebugMode) {
        print('success');
      }
      return AuthData.fromJson(json.decode(res.body));
    } else {
      if (kDebugMode) {
        print('failed');
      }
      return null;
    }
  }
}
