import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/domain/entities/chat_entity.dart';
import 'package:project/feature/Chat/domain/repository/repository.dart';

class FetchUserChatsUseCase {
  final ChatRepository repository;

  FetchUserChatsUseCase({required this.repository});

  /// Invoke to fetch user chats.
  Future<Either<ResponseFailure, List<ChatEntity>>> call() async {
    return await repository.fetchUserChats();
  }
}
