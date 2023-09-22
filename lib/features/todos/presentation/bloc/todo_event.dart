abstract class TodoEvent {}

class FetchTasks extends TodoEvent {}

class RemoveTask extends TodoEvent {
  final int id;

  RemoveTask({required this.id});
}

class CompleteTask extends TodoEvent {
  final int id;

  CompleteTask({required this.id});
}

class RenameTask extends TodoEvent {
  final int id;

  RenameTask({required this.id});
}

class CreateTask extends TodoEvent {
  final String title;

  CreateTask({required this.title});
}