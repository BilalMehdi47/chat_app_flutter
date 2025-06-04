import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import '../entities/chat_detail_entity.dart';
import '../repository/message_repository.dart';

class FetchChatDetailUseCase {
  final MessageRepository repository;

  FetchChatDetailUseCase({ required this.repository });

  /// Fetches full chat (partner + messages) by [chatGroupId], [limit], [cursor].
  /// Returns either a [ResponseFailure] or a [ChatDetailEntity].
  Future<Either<ResponseFailure, ChatDetailEntity>> call({
    required String chatGroupId,
    required String limit,
    required String cursor,
  }) async {
    return await repository.fetchChatDetail(
      chatGroupId: chatGroupId,
      limit: limit,
      cursor: cursor,
    );
  }
}
