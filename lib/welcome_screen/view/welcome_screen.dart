import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:makely/login/view/login_page.dart';
import 'package:makely/register/view/register_page.dart';

class WelcomeScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WelcomeScreen());
  }
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}


class _WelcomeScreen extends State<WelcomeScreen> {
  var sizeLogin = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
      sizeLogin = 0.5;
    }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            )
          ),
        //   child: Container(
        //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        //     child: Text("Utwórz nowe konto lub zaloguj się za pomocą istniejacego konta.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300))
        // ))
          child: Align(alignment:Alignment.bottomCenter, child: AnimatedContainer(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*sizeLogin,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1)
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
            child: Column(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Text("Best app for all", textAlign: TextAlign.center, style: TextStyle(fontSize: 36, fontFamily: 'TTCommons', fontWeight: FontWeight.w600))
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: SignInButton(
                      Buttons.Facebook,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: SignInButton(
                      Buttons.Email,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                    ),
                  ),
                  Divider(color: Colors.black),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: SignInButton(
                      Buttons.Reddit,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ),
                  ]
            ),

        ))),

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     SizedBox(height: 0),
        //     Container(
        //         child: Image.asset('assets/logos/example_logo.png')
        //     ),
        //     Container(
        //         child: Text("Rozpocznij!!",  style: TextStyle(fontWeight: FontWeight.bold, height: 2, fontSize: 30, color: Colors.green, fontFamily: 'TTCommons'))
        //     ),
        //     Container(
        //         margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
        //         child: Text("Utwórz nowe konto lub zaloguj się za pomocą istniejacego konta.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300))
        //     ),
        //     Expanded(child: Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Container(
        //       ),
        //     ),
        //     ),
        //     Container(
        //       margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        //       height: 50.0,
        //       width: 300.0,
        //       child: SignInButton(
        //         Buttons.Email,
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => RegisterPage()),
        //           );
        //         },
        //       ),
        //     ),
        //     Divider(),
        //     Container(
        //         margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text("Masz już konto? ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300)),
        //             new GestureDetector(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(builder: (context) => LoginPage()),
        //                 );
        //               },
        //               child: new Text("Zaloguj się", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', color: Colors.green)),
        //             )
        //           ],
        //         )
        //     ),
        //     //     Divider(
        //     //     ),
        //     //     Container(
        //     //     margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        //     //     child: Row(
        //     //       mainAxisAlignment: MainAxisAlignment.center,
        //     //       children: [
        //     //         Text("Masz już konto? ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'TTCommons', fontWeight: FontWeight.w300)),
        //     //       ],
        //     //     )
        //     //
        //     // ),
        //     // SizedBox(height: 70),
        //     // Container(
        //     //     height: 50.0,
        //     //     width: 300.0,
        //     //     child: SignInButton(
        //     //       Buttons.Google,
        //     //       onPressed: () {},
        //     //     )
        //     // )
        //   ],
        // ),
    );
  }
}
