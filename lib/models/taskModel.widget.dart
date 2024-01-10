import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo_app/models/ApiConnection.dart';

import 'package:path/path.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/request_task_post_schema.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/request_task_put_schema.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/response_error_schema.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/response_task_schema.dart';

enum Status {
  incomplete("未完了"),
  completion("完了");

  const Status(this.displayName);

  final String displayName;
}

const String taskPath = "task";

class TaskModel extends ChangeNotifier {
  TaskModel(this._api);
  final ApiConnection _api;

  Future<Object> retrieveTaskList() async {
    const String type = "get";

    var response = await _api.apiConnection(taskPath, type);
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

    var response =
        await _api.apiConnection(taskPath, type, body: {"name": name});
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

    var response = await _api.apiConnection(path, type);
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

    var response = await _api.apiConnection(path, type,
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

    var response = await _api.apiConnection(path, type);
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
