import 'dart:convert';

import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final int id;
  final String name;


  const Project({required this.name, this.id = 0});
  

  @override
  List<Object?> get props => [name, id];
  

  Project copyWith({
    int? id,
    String? name,
  }) {
    return Project(
      name: name ?? this.name,
      id: id ?? this.id
    );
  }


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
  
    return result;
  }


  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }


  @override
  String toString() => 'Project(id: $id, name: $name)';


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Project &&
      other.id == id &&
      other.name == name;
  }


  @override
  int get hashCode => id.hashCode ^ name.hashCode;

}
