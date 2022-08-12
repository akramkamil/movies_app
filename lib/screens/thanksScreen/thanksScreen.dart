import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/screens/auth_screen/login.dart';
class thanksScreen extends StatefulWidget {
  const thanksScreen({Key? key}) : super(key: key);

  @override
  State<thanksScreen> createState() => _thanksScreenState();
}

class _thanksScreenState extends State<thanksScreen> {
  @override
  initState(){
    goToNextView();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center (
        child: Text('ࡐࡀࡓࡅࡀࡄࡀࡊ '),
      ),
    );
  }
}

void goToNextView(){
  Future.delayed(const Duration(seconds: 5), (){
    Get.to(() => const LoginScreen(),transition: Transition.fade);
  });
}
