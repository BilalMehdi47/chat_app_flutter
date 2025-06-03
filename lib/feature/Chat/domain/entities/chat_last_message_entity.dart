class ChatLastMessageEntity {
  final String id;
  final String content;
  final String emoji;
  final DateTime createdAt;
  final bool isSentByUser;

  ChatLastMessageEntity({
    required this.id,
    required this.content,
    required this.emoji,
    required this.createdAt,
    required this.isSentByUser,
  });
}
