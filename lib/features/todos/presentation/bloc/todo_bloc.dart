import 'dart:developer';

import 'package:empay_test_project/features/todos/data/datasources/tasks_datasource.dart';
import 'package:empay_test_project/features/todos/data/repositories/tasks_repository_impl.dart';
import 'package:empay_test_project/features/todos/domain/entities/task.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_event.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  late TasksRepositoryImpl _tasksRepositoryImpl;

  TodoBloc() : super(TodoState()) {
    on(_onFetchTasks);
    on(_onRemoveTask);
    on(_onCompleteTask);
    on(_onCreateTask);

    _tasksRepositoryImpl =
        TasksRepositoryImpl(tasksDataSource: TasksDataSourceImpl());
  }

  _onFetchTasks(FetchTasks event, Emitter<TodoState> emit) async {
    try {
      final tasks = await _tasksRepositoryImpl.getTasks();
      emit(state.copyWith(tasks: tasks));
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
      log(exception.toString());
    }
  }

  _onRemoveTask(RemoveTask event, Emitter<TodoState> emit) async {
    try {
      await _tasksRepositoryImpl.removeTask(event.id);
      final list = List<Task>.from(state.tasks);
      list.removeWhere((element) => element.id == event.id);
      emit(state.copyWith(tasks: list));
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);

      log(exception.toString());
    }
  }

  _onCompleteTask(CompleteTask event, Emitter<TodoState> emit) async {
    try {
      final newTask = await _tasksRepositoryImpl.completeTask(event.task);
      final list = List<Task>.from(state.tasks);
      list[list.indexOf(event.task)] = newTask;
      emit(state.copyWith(tasks: list));
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);

      log(exception.toString());
    }
  }

  _onCreateTask(CreateTask event, Emitter<TodoState> emit) async {
    try {
      final task = await _tasksRepositoryImpl.createTask(event.title);
      print(task);
      emit(state.copyWith(
        tasks: List<Task>.from(state.tasks)
          ..add(Task(id: task.id, title: event.title)),
      ));
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);

      log(exception.toString());
    }
  }
}
