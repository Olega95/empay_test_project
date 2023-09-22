import 'package:empay_test_project/features/todos/domain/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@Freezed(copyWith: true)
class TodoState with _$TodoState {
  factory TodoState({
    @Default([]) List<Task> tasks,
  }) = _TodoState;
}
