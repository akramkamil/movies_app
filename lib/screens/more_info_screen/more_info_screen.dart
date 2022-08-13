import 'package:flutter/material.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: const DrawerHeader(
                child: Text('More Information',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic
                  ),
                )
            ),
          ),
          GestureDetector(
            onTap: () {},
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
            onTap: () {},
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
