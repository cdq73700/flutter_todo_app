library swagger.api;

import './task_schema.dart';

/// Schema for the response containing task information.
class ResponseTaskSchema {
  
  bool? success;

  List<TaskSchema>? data;

  ResponseTaskSchema();

  @override
  String toString() {
    return 'ResponseTaskSchema[success=$success, data=$data, ]';
  }

  ResponseTaskSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    success = json['success'];
    data = TaskSchema.listFromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data
     };
  }

  static List<ResponseTaskSchema> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? List<ResponseTaskSchema>.empty()
        : json.map((value) => ResponseTaskSchema.fromJson(value)).toList();
  }

  static Map<String, ResponseTaskSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, ResponseTaskSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = ResponseTaskSchema.fromJson(value));
    }
    return map;
  }
}