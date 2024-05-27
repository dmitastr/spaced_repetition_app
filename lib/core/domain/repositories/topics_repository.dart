import 'package:spaced_repetition_app/core/domain/entity/project/project.dart';
import 'package:spaced_repetition_app/core/domain/entity/topic/topic.dart';

abstract class TopicsRepository {
  Future<List<Topic>> getAllTopics(Project project);
  Future<Topic> addNewTopic(Topic topic, Project project);
  Future<Topic> removeTopic(Topic topic);
  Future<Topic> updateTopic(Topic topic);
}