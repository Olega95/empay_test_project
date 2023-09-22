

import 'package:empay_test_project/features/todos/data/models/task_model.dart';
import 'package:empay_test_project/features/todos/domain/entities/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();

  Future<Task> createTask(String title);

  Future<void> removeTask(int id);

  Future<Task> completeTask(TaskModel task);
}