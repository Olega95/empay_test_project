import 'package:empay_test_project/features/todos/domain/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel extends Task with _$TaskModel {
  factory TaskModel(
      {required int id,
      required String title,
      required bool completed}) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
