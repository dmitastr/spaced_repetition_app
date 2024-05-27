import 'package:spaced_repetition_app/core/domain/entity/project/project.dart';
import 'package:spaced_repetition_app/core/domain/repositories/projects_repository.dart';

import '../../../../core/data/models/project_model.dart';
import '../datasources/projects_remote_datasource.dart';


class ProjectsRepositoryImplementation extends ProjectsRepository {
  final ProjectsRemoteDataSource db;

  ProjectsRepositoryImplementation(this.db);

  @override
  Future<Project> addNewProject(Project project) {
    return ProjectsRemoteDataSource.instance.insert(project as ProjectModel);
  }


  @override
  Future<List<Project>> getAllProjects() {
    return ProjectsRemoteDataSource.instance.queryAllRows();
  }


  @override
  Future<int> removeProject(Project project) {
    return ProjectsRemoteDataSource.instance.delete(project as ProjectModel);
  }


  @override
  Future<Project> updateProject(Project project) {
    return ProjectsRemoteDataSource.instance.update(project as ProjectModel);
  }

  
}
