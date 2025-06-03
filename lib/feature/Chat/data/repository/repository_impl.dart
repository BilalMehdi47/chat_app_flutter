import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/data/data_source/remote/remote_data_source.dart';
import 'package:project/feature/Chat/data/model/chat_model.dart';
import 'package:project/feature/Chat/domain/entities/chat_entity.dart';
import 'package:project/feature/Chat/domain/entities/chat_last_message_entity.dart';
import 'package:project/feature/Chat/domain/repository/repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ResponseFailure, List<ChatEntity>>> fetchUserChats() async {
    final eitherModels = await remoteDataSource.fetchUserChats();

    return eitherModels.fold(
          (failure) => Left(failure),
          (modelList) {
        try {
          final entities = modelList.map(_mapModelToEntity).toList();
          return Right(entities);
        } catch (e) {
          return Left(ResponseFailure("Mapping error: $e"));
        }
      },
    );
  }

  ChatEntity _mapModelToEntity(ChatModel model) {
    final last = model.lastMessage;
    final lastEntity = ChatLastMessageEntity(
      id: last.id,
      content: last.content,
      emoji: last.emoji,
      createdAt: last.createdAt,
      isSentByUser: last.isSentByUser,
    );

    return ChatEntity(
      chatGroupId: model.chatGroupId,
      partnerId: model.partnerId,
      partnerName: model.partnerName,
      partnerProfilePic: model.partnerProfilePic,
      lastMessage: lastEntity,
      unreadCount: model.unreadCount,
    );
  }
}
