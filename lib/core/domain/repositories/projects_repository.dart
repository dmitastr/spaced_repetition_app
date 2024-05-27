import 'package:spaced_repetition_app/core/domain/entity/project/project.dart';

abstract class ProjectsRepository {
  Future<List<Project>> getAllProjects();
  Future<Project> addNewProject(Project project);
  Future<int> removeProject(Project project);
  Future<Project> updateProject(Project project);
}