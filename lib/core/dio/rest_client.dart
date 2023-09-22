import 'package:dio/dio.dart';
import 'package:empay_test_project/features/todos/data/models/task_model.dart';
import 'package:empay_test_project/features/todos/domain/entities/task.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/todo')
  Future<List<TaskModel>> getTasks();

  @POST('/todo')
  Future<TaskModel> addTask(@Body() TaskModel task);

  @PATCH('/todo/{id}')
  Future<void> completeTask(@Path() int id, @Body() Task task);

  @DELETE('/todo/{id}')
  Future<void> removeTask(@Path() int id);
}
