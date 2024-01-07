part of swagger.api;

class ResponseTaskSchema {
  
  bool success = null;

  List<TaskSchema> data = [];

  ResponseTaskSchema();

  @override
  String toString() {
    return 'ResponseTaskSchema[success=$success, data=$data, ]';
  }

  ResponseTaskSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
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
    return json == null ? new List<ResponseTaskSchema>() : json.map((value) => new ResponseTaskSchema.fromJson(value)).toList();
  }

  static Map<String, ResponseTaskSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ResponseTaskSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ResponseTaskSchema.fromJson(value));
    }
    return map;
  }
}
