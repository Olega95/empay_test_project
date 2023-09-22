import 'package:empay_test_project/features/todos/presentation/bloc/todo_event.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on(_onFetchTasks);
    on(_onRemoveTask);
    on(_onCompleteTask);
    on(_onRenameTask);
    on(_onCreateTask);
  }

  _onFetchTasks(FetchTasks event, Emitter<TodoState> emit) {}

  _onRemoveTask(RemoveTask event, Emitter<TodoState> emit) {}

  _onCompleteTask(CompleteTask event, Emitter<TodoState> emit) {}

  _onRenameTask(RenameTask event, Emitter<TodoState> emit) {}

  _onCreateTask(CreateTask event, Emitter<TodoState> emit) {}
}
