class MessageEntity {
  final String id;
  final String senderId;
  final String content;
  final String emoji;
  final DateTime createdAt;
  final bool isRead;
  final bool isSentByUser;
  final String chatGroupId;

  MessageEntity({
    required this.id,
    required this.senderId,
    required this.content,
    required this.emoji,
    required this.createdAt,
    required this.isRead,
    required this.isSentByUser,
    required this.chatGroupId, // Include it here if needed
  });
}