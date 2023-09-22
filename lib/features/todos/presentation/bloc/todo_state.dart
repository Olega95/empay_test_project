import 'package:empay_test_project/features/todos/domain/entities/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@Freezed(copyWith: true)
class TodoState with _$TodoState {
  factory TodoState({
    @Default([]) List<Todo> allTodos,
    @Default([]) List<Todo> activeTodos,
    @Default([]) List<Todo> completedTodos,
  }) = _TodoState;
}
