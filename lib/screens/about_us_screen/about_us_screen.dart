import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network('https://www.eventbrite.ie/blog/wp-content/uploads/2022/06/online-event-plan-1.png',
            scale: .5,),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Text('we collect all what you want from interesting events that near to you',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1,
                wordSpacing: 2,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
