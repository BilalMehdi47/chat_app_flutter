import 'partner_entity.dart';
import 'message_entity.dart';

class ChatDetailEntity {
  final String chatGroupId;
  final PartnerEntity partner;
  final List<MessageEntity> messages;

  ChatDetailEntity({
    required this.chatGroupId,
    required this.partner,
    required this.messages,
  });
}