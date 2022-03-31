import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class TaskRepository {
  //var url = 'http://10.0.2.2:8000';
  var url = 'http://makely.foo.wtf';


  Future<void> checkToken() async {
    var storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'api_token');
    if (value != null) {
      bool hasExpired = JwtDecoder.isExpired(value);
      if (hasExpired) {
        print("Refreshing!");
        var url = Uri.parse(this.url + '/api/users/refresh_token');
        String? refresh_token = await storage.read(key: 'refresh_token');
        final http.Response response = await http.post(
            url,
            headers: {"Content-Type": "application/json", "Authorization": "Bearer $refresh_token"},
        );
        if (response.statusCode == 200) {
          print("Refreshed!");
          var resp = jsonDecode(response.body);
          storage.write(key: "api_token", value: resp['access_token']);
        }
      }
    }
  }

  Future<List<dynamic>> getTask() async {
    await checkToken();

    var url = Uri.parse(this.url + '/api/tasks');
    var storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'api_token');

    final http.Response response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $value"},
    );
    var resp = jsonDecode(response.body);
    return resp['tasks'];
  }

  Future<void> addTask(String topic) async {
    await checkToken();
    var url = Uri.parse(this.url + '/api/tasks');
    Map data = {
      "task": {
        "topic": topic,
        "description": "string"
      }
    };
    var body = json.encode(data);
    var storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'api_token');
    final http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $value"},
        body: body
    );
    var resp = jsonDecode(response.body);
  }

  Future<void> updateTask(String topic, String id) async {
    await checkToken();
    print("updateTask ===");
    print(topic);
    print(id);
    var url = Uri.parse(this.url + '/api/tasks/' + id);
    Map data = {
      "task": {
        "topic": topic,
        "description": "string"
      }
    };
    var body = json.encode(data);
    var storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'api_token');
    final http.Response response = await http.patch(
        url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $value"},
        body: body
    );
    var resp = jsonDecode(response.body);
  }

  Future<void> finishTask(task_id) async {
    await checkToken();
    var url = Uri.parse(this.url + '/api/tasks/' + task_id);
    Map data = {
      "task": {
        "completed": true
      }
    };
    var body = json.encode(data);
    var storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'api_token');
    final http.Response response = await http.patch(
        url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $value"},
        body: body
    );
    var resp = jsonDecode(response.body);
  }

  Future<void> deleteTask(task_id) async {
    await checkToken();
    var url = Uri.parse(this.url + '/api/tasks/' + task_id);
    Map data = {
      "task": {
        "deleted": true
      }
    };
    var body = json.encode(data);
    var storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'api_token');
    final http.Response response = await http.patch(
        url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $value"},
        body: body
    );
    var resp = jsonDecode(response.body);
  }

}
