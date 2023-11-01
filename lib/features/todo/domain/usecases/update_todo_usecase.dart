import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:skripsi_v2/common/usecase/usecase.dart';
import 'package:skripsi_v2/features/todo/data/models/todo.dart';
import 'package:skripsi_v2/features/todo/domain/repositories/todo_repository.dart';

@immutable
class UpdateTodoUseCase implements UseCase<bool, UpdateTodoParams> {
  final TodoRepository todoRepository;

  const UpdateTodoUseCase(this.todoRepository);

  @override
  Future<Either<String, bool>> call(UpdateTodoParams params) async {
    return await todoRepository.updateTodo(params.todo);
  }
}

@immutable
class UpdateTodoParams {
  final ToDo todo;

  const UpdateTodoParams(this.todo);
}
