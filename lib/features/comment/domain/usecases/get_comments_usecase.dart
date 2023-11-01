import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:skripsi_v2/common/usecase/usecase.dart';
import 'package:skripsi_v2/features/comment/data/models/comment.dart';
import 'package:skripsi_v2/features/comment/domain/repositories/comment_repository.dart';

@immutable
class GetCommentsUseCase implements UseCase<List<Comment>, GetCommentsParams> {
  final CommentRepository commentRepository;

  const GetCommentsUseCase(this.commentRepository);

  @override
  Future<Either<String, List<Comment>>> call(GetCommentsParams params) async {
    return await commentRepository.getComments(params.postId);
  }
}

@immutable
class GetCommentsParams {
  final int postId;

  const GetCommentsParams({required this.postId});
}
