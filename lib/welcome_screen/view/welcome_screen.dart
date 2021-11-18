import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:makely/login/view/login_page.dart';


class WelcomeScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              backgroundColor: Colors.green,
            )
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0),
            Container(
                child: Image.asset('assets/logos/example_logo.png')
            ),
            Container(
                child: Text("Rozpocznij!!",  style: TextStyle(fontWeight: FontWeight.bold, height: 2, fontSize: 30, color: Colors.green, fontFamily: 'TTCommons'))
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Text("Utwórz nowe konto lub zaloguj się za pomocą istniejacego konta.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300))
            ),
            Expanded(child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
              ),
            ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              height: 50.0,
              width: 300.0,
              child: SignInButton(
                Buttons.Email,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),

            Divider(),
            Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Masz już konto? ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300)),
                    Text("Zaloguj się", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', color: Colors.green))
                  ],
                )
            ),
            //     Divider(
            //     ),
            //     Container(
            //     margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text("Masz już konto? ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300)),
            //       ],
            //     )
            //
            // ),
            // SizedBox(height: 70),
            // Container(
            //     height: 50.0,
            //     width: 300.0,
            //     child: SignInButton(
            //       Buttons.Google,
            //       onPressed: () {},
            //     )
            // )
          ],
        ),
    );
  }
}
