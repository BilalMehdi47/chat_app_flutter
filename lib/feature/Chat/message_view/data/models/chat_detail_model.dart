import 'partner_model.dart';
import 'message_model.dart';

class ChatDetailModel {
  final String chatGroupId;
  final PartnerModel partner;
  final List<MessageModel> messages;

  ChatDetailModel({
    required this.chatGroupId,
    required this.partner,
    required this.messages,
  });

  factory ChatDetailModel.fromJson(Map<String, dynamic> data) {
    final groupId = data['chatGroupId'] as String;

    final partner = PartnerModel.fromJson(data['partner'] as Map<String, dynamic>);

    final msgsJson = data['messages'] as List<dynamic>? ?? [];
    final messages = msgsJson
        .cast<Map<String, dynamic>>()
        .map((msgJson) => MessageModel.fromJson(
      msgJson,
      chatGroupId: groupId,
    ))
        .toList();

    return ChatDetailModel(
      chatGroupId: groupId,
      partner: partner,
      messages: messages,
    );
  }
}
