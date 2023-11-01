import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:skripsi_v2/common/usecase/usecase.dart';
import 'package:skripsi_v2/features/comment/data/models/comment.dart';
import 'package:skripsi_v2/features/comment/domain/repositories/comment_repository.dart';

@immutable
class DeleteCommentUseCase implements UseCase<bool, DeleteCommentParams> {
  final CommentRepository commentRepository;

  const DeleteCommentUseCase(this.commentRepository);

  @override
  Future<Either<String, bool>> call(DeleteCommentParams params) async {
    return await commentRepository.deleteComment(params.comment);
  }
}

@immutable
class DeleteCommentParams {
  final Comment comment;

  const DeleteCommentParams(this.comment);
}
