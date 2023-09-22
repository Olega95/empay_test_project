import 'package:dio/dio.dart';
import 'package:empay_test_project/core/dio/rest_client.dart';
import 'package:empay_test_project/features/todos/data/models/task_model.dart';

abstract class TasksDataSource {
  Future<List<TaskModel>> getTasks();

  Future<TaskModel> createTask(TaskModel task);

  Future<void> removeTask(int id);

  Future<void> completeTask(TaskModel task);
}

class TasksDataSourceImpl implements TasksDataSource {
  final Dio _dio = Dio(BaseOptions(contentType: Headers.jsonContentType));

  @override
  Future<void> completeTask(TaskModel task) async {
    final client = RestClient(_dio);
    return client.completeTask(task.id!, task);
  }

  @override
  Future<TaskModel> createTask(TaskModel task) {
    final client = RestClient(_dio);
    return client.addTask(TaskModel(title: task.title));
  }

  @override
  Future<List<TaskModel>> getTasks() {
    final client = RestClient(_dio);
    return client.getTasks();
  }

  @override
  Future<void> removeTask(int id) {
    final client = RestClient(_dio);
    return client.removeTask(id);
  }
  
 
}
