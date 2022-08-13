import 'package:flutter/material.dart';
import 'package:movies_app/providers/general_provider.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var generalProvider = context.watch<GeneralProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.network('https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png',
                    scale: 2.5),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Name: ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      TextSpan(
                          text: ' ${generalProvider.selectedUser!.username}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ]
                  )
                ),
                 const SizedBox(
                   height: 30,
                 ),
                 Text.rich(
                    TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Email: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          TextSpan(
                              text: ' ${generalProvider.selectedUser!.email}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ]
                    )
                ),
                const SizedBox(
                  height: 30,
                ),
                 Text.rich(
                    TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Phone Number: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          TextSpan(
                              text: ' ${generalProvider.selectedUser!.phoneNumber}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ]
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
