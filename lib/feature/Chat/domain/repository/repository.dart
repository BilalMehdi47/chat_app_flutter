import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  /// Returns either a [ResponseFailure] or a List of [ChatEntity].
  Future<Either<ResponseFailure, List<ChatEntity>>> fetchUserChats();
}
