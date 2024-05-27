import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spaced_repetition_app/core/data/datasources/datasource.dart';
import 'package:spaced_repetition_app/core/data/models/project_model.dart';

import '../../../../core/errors/exceptions.dart';


const PROJECTS_LIST = 'PROJECTS_LIST';


class ProjectsLocalDataSource extends DataSource<ProjectModel> {
  final SharedPreferences sharedPreferences;

  ProjectsLocalDataSource(this.sharedPreferences);


  @override 
  Future<ProjectModel> insert(ProjectModel newEntry) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  
  @override
  Future<int> delete(newEntry) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProjectModel>> queryAllRows() {
    final jsonRaw = sharedPreferences.getString(PROJECTS_LIST);

    if (jsonRaw != null) {
      final jsonParsed = json.decode(jsonRaw).map((entry) => ProjectModel.fromJson(entry));
      return Future.value(jsonParsed);

    } else {
      throw CacheException();
    }
  }
  
  @override
  Future<ProjectModel> update(ProjectModel newEntry) {
    // TODO: implement update
    throw UnimplementedError();
  }


}