library swagger.api;

/// Database model for representing a Task.
class TaskModelSchemas {
  
  String? id;

  String? name;

  double? status;

  DateTime? createdAt;

  DateTime? updatedAt;

  TaskModelSchemas();

  @override
  String toString() {
    return 'TaskModelSchemas[id=$id, name=$name, status=$status, createdAt=$createdAt, updatedAt=$updatedAt, ]';
  }

  TaskModelSchemas.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
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
      'createdAt': createdAt == null ? '' : createdAt?.toUtc().toIso8601String(),
      'updatedAt': updatedAt == null ? '' : updatedAt?.toUtc().toIso8601String()
     };
  }

  static List<TaskModelSchemas> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? List<TaskModelSchemas>.empty()
        : json.map((value) => TaskModelSchemas.fromJson(value)).toList();
  }

  static Map<String, TaskModelSchemas> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, TaskModelSchemas>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = TaskModelSchemas.fromJson(value));
    }
    return map;
  }
}