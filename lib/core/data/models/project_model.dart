import 'dart:convert';

import 'package:spaced_repetition_app/core/domain/entity/project/project.dart';

class ProjectModel extends Project {

  const ProjectModel({
    required super.name,
    super.id,
  });


  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));


  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }
}
