import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/data/model/chat_model.dart';

abstract class ChatRemoteDataSource {
  /// Calls GET /chats and returns Either a [ResponseFailure] or List<ChatModel>.
  Future<Either<ResponseFailure, List<ChatModel>>> fetchUserChats();
}
