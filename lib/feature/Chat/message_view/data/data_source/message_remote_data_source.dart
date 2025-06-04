import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/message_view/data/models/chat_detail_model.dart';

abstract class MessageRemoteDataSource {
  /// Calls GET /chats/{chatGroupId}?limit=&cursor=
  /// Returns either a [ResponseFailure] or a [ChatDetailModel].
  Future<Either<ResponseFailure, ChatDetailModel>> fetchChatDetail({
    required String chatGroupId,
    required String limit,
    required String cursor,
  });
}
