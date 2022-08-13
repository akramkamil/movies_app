import 'package:flutter/material.dart';
import 'package:movies_app/models/user.dart';

class GeneralProvider with ChangeNotifier{
  User? selectedUser;
  String LogedEmail ='';
  String LogedPassword= '';
}