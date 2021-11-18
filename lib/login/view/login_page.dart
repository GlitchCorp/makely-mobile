import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makely/login/login.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: LoginForm(),
      ),
    );
  }
}