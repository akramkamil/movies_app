import 'package:flutter/material.dart';
import 'package:movies_app/providers/auth_provider.dart';
import 'package:movies_app/providers/userProvider.dart';
import 'package:movies_app/screens/auth_screen/login_screen.dart';
import 'package:movies_app/screens/thanksScreen/thanksScreen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const namedRoute = 'signup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordtroller = TextEditingController();
  var authProvider = AuthProvider();
  var userProvider = UserProvider();

  var isMatched = true;
  var isNotEmpty = true;

  @override
  Widget build(BuildContext context) {
    authProvider = context.read<AuthProvider>();
    userProvider = context.read<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Name'),
              controller: nameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              controller: emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Phone Number'),
              controller: phoneNumberController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'password'),
              controller: passwordController,
              obscureText: true,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Confirm Password'),
              controller: confirmPasswordtroller,
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  if (nameController.text != '' &&
                      emailController.text != '' &&
                      phoneNumberController.text != '' &&
                      passwordController.text != '') {
                    if (passwordController.text ==
                        confirmPasswordtroller.text) {
                      authProvider.signUpUser(emailController.text,
                          passwordController.text, nameController.text);
                      userProvider.addUsers(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          phoneNumberController.text);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const ThanksScreen()));
                    } else {
                      setState(() {
                        isMatched = false;
                      });
                      return;
                    }
                  } else {
                    setState(() {
                      isNotEmpty = false;
                    });
                  }
                },
                child: const Text('Sign Up ')),
            isNotEmpty
                ? const Text('')
                : const Text('please complete your information'),
            isMatched
                ? const Text('')
                : const Text('your password is not matched'),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                },
                child: const Text('Alredy have an account? login'))
          ],
        ),
      ),
    );
  }
}
