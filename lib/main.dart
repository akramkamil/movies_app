import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/providers/auth_provider.dart';
import 'package:movies_app/providers/general_provider.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/providers/userProvider.dart';
import 'package:movies_app/screens/auth_screen/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MoviesApplication());
}

class MoviesApplication extends StatelessWidget {
  const MoviesApplication({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => UserProvider()),
        ChangeNotifierProvider(create: (ctx) => GeneralProvider()),
        ChangeNotifierProvider(create: (ctx) => MoviesProvider()),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          routes: {SignUpScreen.namedRoute: (ctx) => const SignUpScreen()},
          title: 'Movies application',
          theme: ThemeData(
            primaryColor: Colors.black,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.brown[200]),
            primarySwatch: Colors.blue,
          ),
          home: const SignUpScreen()),
    );
  }
}
