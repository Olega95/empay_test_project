import 'package:empay_test_project/features/todos/presentation/bloc/todo_event.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on(_onFetchTodos);
    on(_onRemoveTodo);
    on(_onCompleteTodo);
  }

  _onFetchTodos(FetchTodos event, Emitter<TodoState> emit) {

  }

  _onRemoveTodo(RemoveTodo event, Emitter<TodoState> emit) {
    
  }

  _onCompleteTodo(CompleteTodo event, Emitter<TodoState> emit) {
    
  }
}