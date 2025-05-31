import 'package:project/feature/Chat/data/model/ChatLastMessageModel.dart';

class ChatModel {
  final String chatGroupId;
  final String partnerId;
  final String partnerName;
  final String partnerProfilePic;
  final ChatLastMessageModel lastMessage;
  final int unreadCount;

  ChatModel({
    required this.chatGroupId,
    required this.partnerId,
    required this.partnerName,
    required this.partnerProfilePic,
    required this.lastMessage,
    required this.unreadCount,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    chatGroupId: json['chatGroupId'] as String,
    partnerId: json['partnerId'] as String,
    partnerName: json['partnerName'] as String,
    partnerProfilePic: json['partnerProfilePic'] as String,
    lastMessage: ChatLastMessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>),
    unreadCount: json['unreadCount'] as int,
  );

  // ChatGroup toEntity() => ChatGroup(
  //   id: chatGroupId,
  //   partnerId: partnerId,
  //   partnerName: partnerName,
  //   partnerProfilePic: partnerProfilePic,
  //   lastMessage: lastMessage.toEntity(),
  //   unreadCount: unreadCount,
  // );
}
