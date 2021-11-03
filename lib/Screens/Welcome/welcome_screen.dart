import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Example',
        home: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(0.0), // here the desired height
                child: AppBar(
                  backgroundColor: Colors.green,
                  title: const Text('Sample Code 1234'),
                )
            ),

            body: Center(child: Text('You have pressed the button times.')),
        )
    );
  }
}

