import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/model/list_request_model.dart';
import 'package:todo_app/model/todo_item.dart';
import 'urls.dart';

class Session {
  Map<String, String> headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<List> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    return json.decode(response.body);
  }

  void post(String url, ListRequestModel request) async {
    var body = jsonEncode(request.toJson());
    http.Response response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);
    print(response.statusCode);
  }
}
