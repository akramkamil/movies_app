import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/user.dart';
import 'dart:convert';


class UserServices with ChangeNotifier {

  Future<void> addUsers(String name, String email, String phoneNumber,
      String password) async {
    await http.post(Uri.parse(
        'https://movies-app-13096-default-rtdb.firebaseio.com/user.json'),
        body: json.encode({
          'username': name,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber
        })
    );
  }

  Future<List<User>> getAllUsers () async{
    List<User> users =[];
    var res = await http.get(Uri.parse('https://movies-app-13096-default-rtdb.firebaseio.com/user.json'));
    var allUsersJson = json.decode(res.body) as Map<String, dynamic>;

    for(var x in allUsersJson.keys){
      users.add(User.fromJson(allUsersJson[x], x));
      notifyListeners();
    }
    return users;
  }
}