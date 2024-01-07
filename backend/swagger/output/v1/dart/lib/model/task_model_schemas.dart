part of swagger.api;

class TaskModelSchemas {
  
  String id = null;

  String name = null;

  double status = null;

  DateTime createdAt = null;

  DateTime updatedAt = null;

  TaskModelSchemas();

  @override
  String toString() {
    return 'TaskModelSchemas[id=$id, name=$name, status=$status, createdAt=$createdAt, updatedAt=$updatedAt, ]';
  }

  TaskModelSchemas.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'] == null ? null : DateTime.parse(json['createdAt']);
    updatedAt = json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'createdAt': createdAt == null ? '' : createdAt.toUtc().toIso8601String(),
      'updatedAt': updatedAt == null ? '' : updatedAt.toUtc().toIso8601String()
     };
  }

  static List<TaskModelSchemas> listFromJson(List<dynamic> json) {
    return json == null ? new List<TaskModelSchemas>() : json.map((value) => new TaskModelSchemas.fromJson(value)).toList();
  }

  static Map<String, TaskModelSchemas> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TaskModelSchemas>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TaskModelSchemas.fromJson(value));
    }
    return map;
  }
}
