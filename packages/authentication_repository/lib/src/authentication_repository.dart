import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  var url = 'http://makely.foo.wtf';
  //var url = 'http://10.0.2.2:8000';
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    print("Test?");
    var url = Uri.parse(this.url + '/api/users/login');
    Map user_data = {
      'email': email,
      'password': password,
      'username': email
    };
    Map data = {
      'user': user_data
    };
    var body = json.encode(user_data);
    final http.Response response = await http.post(
        url,
        body: user_data
    );
    var storage = FlutterSecureStorage();
    print(response.body);
    if (response.statusCode == 200) {
      var resp = jsonDecode(response.body);
      storage.write(key: "api_token", value: resp['access_token']);
      storage.write(key: "refresh_token", value: resp['refresh_token']);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse(this.url + '/api/users');
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
