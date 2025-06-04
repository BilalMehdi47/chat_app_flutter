import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/message_view/data/data_source/message_remote_data_source.dart';
import 'package:project/feature/Chat/message_view/domain/entities/chat_detail_entity.dart';
import 'package:project/feature/Chat/message_view/domain/entities/partner_entity.dart';
import 'package:project/feature/Chat/message_view/domain/entities/message_entity.dart';
import 'package:project/feature/Chat/message_view/domain/repository/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({ required this.remoteDataSource });

  @override
  Future<Either<ResponseFailure, ChatDetailEntity>> fetchChatDetail({
    required String chatGroupId,
    required String limit,
    required String cursor,
  }) async {
    // 1. Delegate to remote data source
    final eitherModel = await remoteDataSource.fetchChatDetail(
      chatGroupId: chatGroupId,
      limit: limit,
      cursor: cursor,
    );

    // 2. Fold on Either: map model → entity or propagate failure
    return eitherModel.fold(
          (failure) => Left(failure),
          (model) {
        try {
          // Map PartnerModel → PartnerEntity
          final partnerModel = model.partner;
          final partnerEntity = PartnerEntity(
            id: partnerModel.id,
            name: partnerModel.name,
            profilePic: partnerModel.profilePic,
          );

          // Map each MessageModel → MessageEntity
          final messageEntities = model.messages.map((msgModel) {
            return MessageEntity(
              id: msgModel.id,
              senderId: msgModel.senderId,
              content: msgModel.content,
              emoji: msgModel.emoji,
              createdAt: msgModel.createdAt,
              isRead: msgModel.isRead,
              isSentByUser: msgModel.isSentByUser,
              chatGroupId: msgModel.chatGroupId, // Include chatGroupId
            );
          }).toList();

          // Combine into ChatDetailEntity
          final chatDetailEntity = ChatDetailEntity(
            chatGroupId: model.chatGroupId,
            partner: partnerEntity,
            messages: messageEntities,
          );

          return Right(chatDetailEntity);
        } catch (e) {
          return Left(ResponseFailure("Mapping error: $e"));
        }
      },
    );
  }
}
