import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:test_application/models/swagger/v1/model/request_task_post_schema.dart';
import 'package:test_application/models/swagger/v1/model/request_task_put_schema.dart';
import 'package:test_application/models/swagger/v1/model/response_error_schema.dart';
import 'package:test_application/models/swagger/v1/model/response_task_schema.dart';
import 'package:http/http.dart' as http;

enum Status {
  incomplete("未完了"),
  completion("完了");

  const Status(this.displayName);

  final String displayName;
}

const String urlBase = "http://localhost:4000/api/v1";
const String urlBasePhone = "http://10.0.2.2:4000/api/v1";

const String taskPath = "task";

class TaskModel extends ChangeNotifier {
  Future<Response> apiConnection(String path, String type,
      {Object? body}) async {
    Uri url;
    Response response;

    if (kIsWeb) {
      url = Uri.parse(join(urlBase, path));
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        url = Uri.parse(join(urlBasePhone, path));
      } else {
        url = Uri.parse(join(urlBase, path));
      }
    }

    switch (type) {
      case "get":
        response = await http.get(url);
        break;
      case "post":
        response = await http.post(url, body: body);
        break;
      case "put":
        response = await http.put(url, body: body);
        break;
      case "delete":
        response = await http.delete(url);
        break;
      default:
        response = Response("", 500);
        break;
    }

    return response;
  }

  Future<Object> retrieveTaskList() async {
    const String type = "get";

    var response = await apiConnection(taskPath, type);
    if (response.statusCode == 200) {
      final ResponseTaskSchema tasks =
          ResponseTaskSchema.fromJson(jsonDecode(response.body));
      return tasks;
    } else {
      final ResponseErrorSchema error =
          ResponseErrorSchema.fromJson(jsonDecode(response.body));
      return error;
    }
  }

  Future<Object> postTask(String name) async {
    const String type = "post";
    final RequestTaskPostSchema schema = RequestTaskPostSchema();
    schema.name = name;

    var response = await apiConnection(taskPath, type, body: {"name": name});
    if (response.statusCode == 201) {
      final ResponseTaskSchema tasks =
          ResponseTaskSchema.fromJson(jsonDecode(response.body));
      notifyListeners();
      return tasks;
    } else {
      final ResponseErrorSchema error =
          ResponseErrorSchema.fromJson(jsonDecode(response.body));
      return error;
    }
  }

  Future<Object> retrieveTaskById(String id) async {
    const String type = "get";
    final String path = join(taskPath, id);

    var response = await apiConnection(path, type);
    if (response.statusCode == 200) {
      final ResponseTaskSchema tasks =
          ResponseTaskSchema.fromJson(jsonDecode(response.body));
      return tasks;
    } else {
      final ResponseErrorSchema error =
          ResponseErrorSchema.fromJson(jsonDecode(response.body));
      return error;
    }
  }

  Future<Object> putTask(String id, String name, int status) async {
    const String type = "put";
    final String path = join(taskPath, id);
    final RequestTaskPutSchema schema = RequestTaskPutSchema();
    schema.name = name;
    schema.status = status;

    var response = await apiConnection(path, type,
        body: {"name": name, "status": status.toString()});
    if (response.statusCode == 200) {
      final ResponseTaskSchema tasks =
          ResponseTaskSchema.fromJson(jsonDecode(response.body));
      notifyListeners();
      return tasks;
    } else {
      final ResponseErrorSchema error =
          ResponseErrorSchema.fromJson(jsonDecode(response.body));
      return error;
    }
  }

  Future<Object> deleteTask(String id) async {
    const String type = "delete";
    final String path = join(taskPath, id);

    var response = await apiConnection(path, type);
    if (response.statusCode == 204) {
      notifyListeners();
      return true;
    } else {
      final ResponseErrorSchema error =
          ResponseErrorSchema.fromJson(jsonDecode(response.body));
      return error;
    }
  }
}
