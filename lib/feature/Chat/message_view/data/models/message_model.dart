class MessageModel {
  final String id;
  final String senderId;
  final String content;
  final String emoji;
  final DateTime createdAt;
  final bool isRead;
  final bool isSentByUser;
  final String chatGroupId;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.emoji,
    required this.createdAt,
    required this.isRead,
    required this.isSentByUser,
    required this.chatGroupId,
  });

  /// You must pass in [chatGroupId] from the top‐level JSON.
  factory MessageModel.fromJson(
      Map<String, dynamic> json, {
        required String chatGroupId,
      }) =>
      MessageModel(
        id: json['id'] as String,
        senderId: json['senderId'] as String,
        content: json['content'] as String,
        emoji: json['emoji'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        isRead: json['isRead'] as bool,
        isSentByUser: json['isSentByUser'] as bool,
        chatGroupId: chatGroupId,
      );
}
