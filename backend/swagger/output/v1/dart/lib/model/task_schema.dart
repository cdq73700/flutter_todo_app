part of swagger.api;

class TaskSchema {
  
  String id = null;

  String name = null;

  double status = null;

  String createdAt = null;

  String updatedAt = null;

  TaskSchema();

  @override
  String toString() {
    return 'TaskSchema[id=$id, name=$name, status=$status, createdAt=$createdAt, updatedAt=$updatedAt, ]';
  }

  TaskSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt
     };
  }

  static List<TaskSchema> listFromJson(List<dynamic> json) {
    return json == null ? new List<TaskSchema>() : json.map((value) => new TaskSchema.fromJson(value)).toList();
  }

  static Map<String, TaskSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TaskSchema>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TaskSchema.fromJson(value));
    }
    return map;
  }
}
