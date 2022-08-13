import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/providers/auth_provider.dart';
import 'package:movies_app/providers/general_provider.dart';
import 'package:movies_app/providers/userProvider.dart';
import 'package:movies_app/screens/all_movies_screen/all_movies_screen.dart';
import 'package:movies_app/screens/auth_screen/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  initState(){
    context.read<UserProvider>().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    var generalProvider = context.read<GeneralProvider>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var wrongInsertion = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  var res = await authProvider.signInUser(
                      emailController.text, passwordController.text);
                  if (res == null) {
                    setState(() {
                      wrongInsertion = true;
                    });
                    return;
                  } else {
                    generalProvider.selectedUser = context.read<UserProvider>().getSellectedUser(emailController.text, passwordController.text);
                    wrongInsertion = true;
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (cts) => const MoviesScreen()));
                    print(generalProvider.selectedUser!.username);
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Login')),
            Row(
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.namedRoute);
                    },
                    child: const Text("Register now")),
              ],
            ),

            wrongInsertion
                ? const Text('email or password are not find')
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
