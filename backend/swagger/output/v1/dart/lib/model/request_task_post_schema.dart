library swagger.api;

/// Schema for the request containing name.
class RequestTaskPostSchema {
  
  String? name;

  RequestTaskPostSchema();

  @override
  String toString() {
    return 'RequestTaskPostSchema[name=$name, ]';
  }

  RequestTaskPostSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name
     };
  }

  static List<RequestTaskPostSchema> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? List<RequestTaskPostSchema>.empty()
        : json.map((value) => RequestTaskPostSchema.fromJson(value)).toList();
  }

  static Map<String, RequestTaskPostSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, RequestTaskPostSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = RequestTaskPostSchema.fromJson(value));
    }
    return map;
  }
}