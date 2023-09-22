import 'package:empay_test_project/features/todos/domain/entities/task.dart';

abstract class TodoEvent {}

class FetchTasks extends TodoEvent {}

class RemoveTask extends TodoEvent {
  final int id;

  RemoveTask({required this.id});
}

class CompleteTask extends TodoEvent {
  final Task task;

  CompleteTask({required this.task});
}


class CreateTask extends TodoEvent {
  final String title;

  CreateTask({required this.title});
}