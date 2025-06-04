import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import '../entities/chat_detail_entity.dart';

abstract class MessageRepository {
  /// Fetches a single chat’s details (partner + messages) by [chatGroupId].
  ///
  /// [limit] and [cursor] map to the GET parameters: ?limit=&cursor=.
  Future<Either<ResponseFailure, ChatDetailEntity>> fetchChatDetail({
    required String chatGroupId,
    required String limit,
    required String cursor,
  });
}
