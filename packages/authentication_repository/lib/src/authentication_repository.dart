import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
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
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
