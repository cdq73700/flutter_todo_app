library swagger.api;

/// Schema for representing a Task entity.
class TaskSchema {
  
  String? id;

  String name = "";

  int status = 0;

  String createdAt = "";

  String updatedAt = "";

  TaskSchema();

  @override
  String toString() {
    return 'TaskSchema[id=$id, name=$name, status=$status, createdAt=$createdAt, updatedAt=$updatedAt, ]';
  }

  TaskSchema.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
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
    return json.isEmpty
        ? List<TaskSchema>.empty()
        : json.map((value) => TaskSchema.fromJson(value)).toList();
  }

  static Map<String, TaskSchema> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, TaskSchema>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => 
        map[key] = TaskSchema.fromJson(value));
    }
    return map;
  }
}