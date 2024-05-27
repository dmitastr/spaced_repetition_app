import 'dart:convert';

import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String name;
  final int id;
  final int? projectId;

  const Topic({
    required this.name,
    required this.id,
    this.projectId,
  });


@override
List<Object> get props => [name, id];

Topic copyWith({
    String? name,
    int? id,
  }) {
    return Topic(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'id': id});
  
    return result;
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      projectId: map['projectId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source));

  @override
  String toString() => 'Topic(name: $name, id: $id, projectId: $projectId)';
}
