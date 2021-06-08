import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80,
          width: 250,
          child: RaisedButton(
            color: Color(0xffe5e5e5),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    child: SecondScreen(),
                    type: PageTransitionType.bottomToTop),
              );
            },
            child: Text(
              'Create',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
