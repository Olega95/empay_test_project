import 'package:empay_test_project/features/todos/domain/entities/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
@Freezed(copyWith: true)
class TodoModel extends Todo with _$TodoModel{

  factory TodoModel({required int id, required String title}) = _TodoModel;

  
}