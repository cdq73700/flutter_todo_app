part of swagger.api;

class ResponseErrorSchema {
  
  bool success = null;

  ErrorSchema error = null;

  ResponseErrorSchema();

  @override
  String toString() {
    return 'ResponseErrorSchema[success=$success, error=$error, ]';
  }

  ResponseErrorSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    success = json['success'];
    error = new ErrorSchema.fromJson(json['error']);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error': error
     };
  }

  static List<ResponseErrorSchema> listFromJson(List<dynamic> json) {
    return json == null ? new List<ResponseErrorSchema>() : json.map((value) => new ResponseErrorSchema.fromJson(value)).toList();
  }

  static Map<String, ResponseErrorSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ResponseErrorSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ResponseErrorSchema.fromJson(value));
    }
    return map;
  }
}
