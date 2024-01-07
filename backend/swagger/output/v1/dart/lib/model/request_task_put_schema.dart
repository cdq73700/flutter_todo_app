part of swagger.api;

class RequestTaskPutSchema {
  
  String name = null;

  double status = null;

  RequestTaskPutSchema();

  @override
  String toString() {
    return 'RequestTaskPutSchema[name=$name, status=$status, ]';
  }

  RequestTaskPutSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status
     };
  }

  static List<RequestTaskPutSchema> listFromJson(List<dynamic> json) {
    return json == null ? new List<RequestTaskPutSchema>() : json.map((value) => new RequestTaskPutSchema.fromJson(value)).toList();
  }

  static Map<String, RequestTaskPutSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RequestTaskPutSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RequestTaskPutSchema.fromJson(value));
    }
    return map;
  }
}
