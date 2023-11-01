import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:skripsi_v2/common/usecase/usecase.dart';
import 'package:skripsi_v2/features/todo/data/models/todo.dart';
import 'package:skripsi_v2/features/todo/domain/repositories/todo_repository.dart';

@immutable
class DeleteTodoUseCase implements UseCase<bool, DeleteTodoParams> {
  final TodoRepository todoRepository;

  const DeleteTodoUseCase(this.todoRepository);

  @override
  Future<Either<String, bool>> call(DeleteTodoParams params) async {
    return await todoRepository.deleteTodo(params.todo);
  }
}

@immutable
class DeleteTodoParams {
  final ToDo todo;

  const DeleteTodoParams(this.todo);
}
