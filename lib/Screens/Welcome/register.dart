import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

register(String email, String password) async {
  var url = Uri.parse('https://api.makely.app/api/users');
  Map user_data = {
    'email': email,
    'password': password,
    'username': email
  };
  Map data = {
    'user': user_data
  };
  var body = json.encode(data);
  final http.Response response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: body
  );

  var storage = FlutterSecureStorage();
  storage.write(key: "api_token", value: "myvalue");
  if (response.statusCode == 201) {
    var resp = jsonDecode(response.body);
    storage.write(key: "api_token", value: "myvalue");
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}


class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  final emailc = TextEditingController();
  final passwordc = TextEditingController();

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
                      child: TextField(
                        controller: emailc,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                        ),
                      )),
                  SizedBox(height: 30),
                  Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextField(
                        controller: passwordc,
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
                        onPressed: () {
                          register(emailc.text, passwordc.text);
                        },
                      )

                  )
                ])));
  }
}
