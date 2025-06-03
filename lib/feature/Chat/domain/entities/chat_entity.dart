
import 'package:project/feature/Chat/domain/entities/chat_last_message_entity.dart';

class ChatEntity {
  final String chatGroupId;
  final String partnerId;
  final String partnerName;
  final String partnerProfilePic;
  final ChatLastMessageEntity lastMessage;
  final int unreadCount;

  ChatEntity({
    required this.chatGroupId,
    required this.partnerId,
    required this.partnerName,
    required this.partnerProfilePic,
    required this.lastMessage,
    required this.unreadCount,
  });
}
