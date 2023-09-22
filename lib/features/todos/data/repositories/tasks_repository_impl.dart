import 'package:empay_test_project/features/todos/data/datasources/tasks_datasource.dart';
import 'package:empay_test_project/features/todos/data/models/task_model.dart';
import 'package:empay_test_project/features/todos/domain/entities/task.dart';
import 'package:empay_test_project/features/todos/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksDataSource tasksDataSource;

  TasksRepositoryImpl({required this.tasksDataSource});

  @override
  Future<Task> completeTask(Task task) async {
    final model = TaskModel(id: task.id, title: task.title, completed: true);
    await tasksDataSource.completeTask(model);
    final newTask = Task(id: task.id, title: task.title, completed: true);
    return newTask;
  }

  @override
  Future<Task> createTask(String title) async {
    return await tasksDataSource.createTask(TaskModel(title: title));
  }

  @override
  Future<List<Task>> getTasks() async {
    return await tasksDataSource.getTasks();
  }

  @override
  Future<void> removeTask(int id) async {
    return await tasksDataSource.removeTask(id);
  }
}
