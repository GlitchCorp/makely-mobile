import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Example',
        home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 125,
              leading: new IconButton(
                icon: new Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Column(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Dołącz teraz",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'TTCommons'))),
                Text(
                    "Uzupełnij informacje dotyczące Twojego konta, aby zarejestrować się w aplikacji.",
                    softWrap: false,
                    maxLines: 5,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'TTCommons',
                        fontWeight: FontWeight.w300))
              ]),
              backgroundColor: Colors.green,
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 15),
                  Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                        ),
                      )),
                  SizedBox(height: 30),
                  Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        ),
                      ),
                  Expanded(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                    ),
                  ),
                  ),
                  Divider(),
                  Container(
                      child: TextButton(
                        child: Text("Dalej",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green,
                                fontFamily: 'TTCommons')),
                        onPressed: () {},
                      )

                  )
                ])));
  }
}
