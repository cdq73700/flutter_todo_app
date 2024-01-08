library swagger.api;

/// Schema for the request containing name and status.
class RequestTaskPutSchema {
  
  String name = "";

  int status = 0;

  RequestTaskPutSchema();

  @override
  String toString() {
    return 'RequestTaskPutSchema[name=$name, status=$status, ]';
  }

  RequestTaskPutSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
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
    return json.isEmpty
        ? List<RequestTaskPutSchema>.empty()
        : json.map((value) => RequestTaskPutSchema.fromJson(value)).toList();
  }

  static Map<String, RequestTaskPutSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, RequestTaskPutSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = RequestTaskPutSchema.fromJson(value));
    }
    return map;
  }
}