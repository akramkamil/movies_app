import 'package:flutter/material.dart';
import 'package:movies_app/screens/about_us_screen/about_us_screen.dart';
import 'package:movies_app/screens/profile_screen/profile_Screen.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: DrawerHeader(
                child: Text('More Information',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic
                  ),
                )
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ProfileScreen()));
            },
            child: const Text('profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AboutUsScreen()));
            },
            child: const Text('About Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
