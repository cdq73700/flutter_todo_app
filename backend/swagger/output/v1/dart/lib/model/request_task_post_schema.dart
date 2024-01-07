part of swagger.api;

class RequestTaskPostSchema {
  
  String name = null;

  RequestTaskPostSchema();

  @override
  String toString() {
    return 'RequestTaskPostSchema[name=$name, ]';
  }

  RequestTaskPostSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name
     };
  }

  static List<RequestTaskPostSchema> listFromJson(List<dynamic> json) {
    return json == null ? new List<RequestTaskPostSchema>() : json.map((value) => new RequestTaskPostSchema.fromJson(value)).toList();
  }

  static Map<String, RequestTaskPostSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RequestTaskPostSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RequestTaskPostSchema.fromJson(value));
    }
    return map;
  }
}
