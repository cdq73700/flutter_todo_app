part of swagger.api;

class HealthSchema {
  
  bool success = null;

  String data = null;

  HealthSchema();

  @override
  String toString() {
    return 'HealthSchema[success=$success, data=$data, ]';
  }

  HealthSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
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
    return json == null ? new List<HealthSchema>() : json.map((value) => new HealthSchema.fromJson(value)).toList();
  }

  static Map<String, HealthSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HealthSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HealthSchema.fromJson(value));
    }
    return map;
  }
}
