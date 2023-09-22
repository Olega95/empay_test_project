abstract class TodoEvent {}

class FetchTodos extends TodoEvent {}

class RemoveTodo extends TodoEvent {
  final int id;

  RemoveTodo({required this.id});
}

class CompleteTodo extends TodoEvent {
  final int id;

  CompleteTodo({required this.id});
}