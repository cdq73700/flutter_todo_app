library swagger.api;

/// Schema for the response containing health information.
class HealthSchema {
  
  bool? success;

  String? data;

  HealthSchema();

  @override
  String toString() {
    return 'HealthSchema[success=$success, data=$data, ]';
  }

  HealthSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    success = json['success'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data
     };
  }

  static List<HealthSchema> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? List<HealthSchema>.empty()
        : json.map((value) => HealthSchema.fromJson(value)).toList();
  }

  static Map<String, HealthSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, HealthSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = HealthSchema.fromJson(value));
    }
    return map;
  }
}