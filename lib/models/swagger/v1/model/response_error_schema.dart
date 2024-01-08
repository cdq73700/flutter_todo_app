library swagger.api;

import './error_schema.dart';

/// Schema for the response containing error information.
class ResponseErrorSchema {
  
  bool success = false;

  ErrorSchema? error;

  ResponseErrorSchema();

  @override
  String toString() {
    return 'ResponseErrorSchema[success=$success, error=$error, ]';
  }

  ResponseErrorSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    success = json['success'];
    error = ErrorSchema.fromJson(json['error']);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error': error
     };
  }

  static List<ResponseErrorSchema> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? List<ResponseErrorSchema>.empty()
        : json.map((value) => ResponseErrorSchema.fromJson(value)).toList();
  }

  static Map<String, ResponseErrorSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, ResponseErrorSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = ResponseErrorSchema.fromJson(value));
    }
    return map;
  }
}