library swagger.api;

/// Schema for representing a error entity.
class ErrorSchema {
  
  int? code;

  String? message;

  String? path;

  String? timestamp;

  ErrorSchema();

  @override
  String toString() {
    return 'ErrorSchema[code=$code, message=$message, path=$path, timestamp=$timestamp, ]';
  }

  ErrorSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
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
    return json.isEmpty
        ? List<ErrorSchema>.empty()
        : json.map((value) => ErrorSchema.fromJson(value)).toList();
  }

  static Map<String, ErrorSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, ErrorSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = ErrorSchema.fromJson(value));
    }
    return map;
  }
}