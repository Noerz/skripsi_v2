import 'package:skripsi_v2/features/todo/domain/entities/todo_entity.dart';
import 'package:skripsi_v2/features/todo/data/models/todo.dart';
import 'package:skripsi_v2/common/network/api_config.dart';
import 'package:skripsi_v2/common/network/dio_client.dart';
import 'package:skripsi_v2/common/network/api_base.dart';
import 'package:skripsi_v2/di.dart';

abstract class TodoRemoteDataSource {
  Future<List<ToDo>> getTodos(int userId, {TodoStatus? status});

  Future<bool> createTodo(ToDo todo);

  Future<bool> updateTodo(ToDo todo);

  Future<bool> deleteTodo(ToDo todo);
}

class TodoRemoteDataSourceImpl with ApiBase<ToDo> implements TodoRemoteDataSource {
  final DioClient dioClient = getIt<DioClient>();

  @override
  Future<bool> createTodo(ToDo todo) async {
    return await makePostRequest(dioClient.dio.post(ApiConfig.todos, data: todo));
  }

  @override
  Future<bool> updateTodo(ToDo todo) async {
    return await makePutRequest(dioClient.dio.put("${ApiConfig.todos}/${todo.id}", data: todo));
  }

  @override
  Future<bool> deleteTodo(ToDo todo) async {
    return await makeDeleteRequest(dioClient.dio.delete("${ApiConfig.todos}/${todo.id}"));
  }

  @override
  Future<List<ToDo>> getTodos(int userId, {TodoStatus? status}) async {
    Map<String, String> queryParameters = <String, String>{
      'user_id': "$userId"
    };

    if (status != null && status != TodoStatus.all) {
      queryParameters.addAll({'status': status.name});
    }

    return await makeGetRequest(
      dioClient.dio.get(ApiConfig.todos, queryParameters: queryParameters),
      ToDo.fromJson,
    );
  }
}
