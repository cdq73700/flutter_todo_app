part of swagger.api;

class ErrorSchema {
  
  int code = null;

  String message = null;

  String path = null;

  String timestamp = null;

  ErrorSchema();

  @override
  String toString() {
    return 'ErrorSchema[code=$code, message=$message, path=$path, timestamp=$timestamp, ]';
  }

  ErrorSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code = json['code'];
    message = json['message'];
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'path': path,
      'timestamp': timestamp
     };
  }

  static List<ErrorSchema> listFromJson(List<dynamic> json) {
    return json == null ? new List<ErrorSchema>() : json.map((value) => new ErrorSchema.fromJson(value)).toList();
  }

  static Map<String, ErrorSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ErrorSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ErrorSchema.fromJson(value));
    }
    return map;
  }
}
