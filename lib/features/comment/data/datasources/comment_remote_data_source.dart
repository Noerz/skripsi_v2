import 'package:skripsi_v2/features/comment/data/models/comment.dart';
import 'package:skripsi_v2/common/network/api_base.dart';
import 'package:skripsi_v2/common/network/api_config.dart';
import 'package:skripsi_v2/common/network/dio_client.dart';
import 'package:skripsi_v2/di.dart';

abstract class CommentRemoteDataSource {
  Future<List<Comment>> getComments(int postId);

  Future<bool> createComment(Comment comment);

  Future<bool> deleteComment(Comment comment);
}

class CommentRemoteDataSourceImpl with ApiBase<Comment> implements CommentRemoteDataSource {
  final DioClient dioClient = getIt<DioClient>();

  @override
  Future<bool> createComment(Comment comment) async {
    return await makePostRequest(dioClient.dio.post(ApiConfig.comments, data: comment));
  }

  @override
  Future<bool> deleteComment(Comment comment) async {
    return await makeDeleteRequest(dioClient.dio.delete("${ApiConfig.comments}/?id=${comment.id}"));
  }

  @override
  Future<List<Comment>> getComments(int postId) async {
    final queryParameters = {'post_id': "$postId"};

    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.comments, queryParameters: queryParameters),
        Comment.fromJson);
  }
}
