import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/screens/auth_screen/login_screen.dart';
class ThanksScreen extends StatefulWidget {
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  State<ThanksScreen> createState() => _ThanksScreenState();
}

class _ThanksScreenState extends State<ThanksScreen> {
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
