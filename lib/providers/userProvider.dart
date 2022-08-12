import 'package:flutter/material.dart';
import 'package:movies_app/models/user.dart';
import 'package:movies_app/services/userServices.dart';

class UserProvider with ChangeNotifier {
  List<User> users= [];
  UserServices _us = UserServices();
  void addUsers (
      String username,
      String email,
      String password,
      String phoneNumber
      ) async {
    await _us.addUsers(username, email, phoneNumber, password);
  }
  Future<void> getAllUsers() async{
    users = await _us.getAllUsers();
  }

  User? getSellected(String email, String password) {
    try{
    for (User u in users){
      if(email == u.email && password == u.password){
        return u;
      }
      break;
    }
  } catch(ex) {
      rethrow;
    }
  }
}