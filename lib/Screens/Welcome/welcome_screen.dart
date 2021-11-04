import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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

          // body: Stack(
          //     children: <Widget>[
          //       Container(
          //         alignment: Alignment(0.7, -0.6),
          //         child: Image.asset('assets/logos/example_logo.png')
          //       ),
          //       Container(
          //           alignment: Alignment(0, 0),
          //           child: Text("Rozpocznij")
          //       ),
          //       Container(
          //           alignment: Alignment(0, 0.55),
          //           height: 50.0,
          //           width: 700.0,
          //           child: SignInButton(
          //             Buttons.Facebook,
          //             onPressed: () {},
          //           )
          //
          //       )
          //     ],
          // ),
          body:               Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                        Container(
                          alignment: Alignment(0.7, -0.6),
                          child: Image.asset('assets/logos/example_logo.png')
                        ),
                        SizedBox(height: 25.0),
                        Container(
                            alignment: Alignment(0, 0),
                            child: Text("Rozpocznij")
                        ),
                        SizedBox(height: 250.0),
                        Container(
                            alignment: Alignment(0, 0.115),
                            height: 50.0,
                            width: 700.0,

                            child: SignInButton(
                              Buttons.Facebook,
                              onPressed: () {},
                            )

                        ),
                  SizedBox(height: 30.0),
                  Container(
                      alignment: Alignment(0, 0.115),
                      height: 50.0,
                      width: 400.0,

                      child: SignInButton(
                        Buttons.Google,
                        onPressed: () {},
                      )

                  )
                ],
              ),
            ),
          )
          ),
        );
  }
}

