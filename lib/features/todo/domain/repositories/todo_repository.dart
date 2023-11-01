import 'package:skripsi_v2/features/todo/domain/entities/todo_entity.dart';
import 'package:skripsi_v2/features/todo/data/models/todo.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<String, List<ToDo>>> getTodos(int userId, {TodoStatus? status});

  Future<Either<String, bool>> createTodo(ToDo todo);

  Future<Either<String, bool>> updateTodo(ToDo todo);

  Future<Either<String, bool>> deleteTodo(ToDo todo);
}
