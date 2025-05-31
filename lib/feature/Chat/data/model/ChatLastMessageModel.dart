class ChatLastMessageModel {
  final String id;
  final String content;
  final String emoji;
  final DateTime createdAt;
  final bool isSentByUser;

  ChatLastMessageModel({
    required this.id,
    required this.content,
    required this.emoji,
    required this.createdAt,
    required this.isSentByUser,
  });

  factory ChatLastMessageModel.fromJson(Map<String, dynamic> json) => ChatLastMessageModel(
    id: json['id'] as String,
    content: json['content'] as String,
    emoji: json['emoji'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    isSentByUser: json['isSentByUser'] as bool,
  );

  // ChatMessage toEntity() => ChatMessage(
  //   id: id,
  //   content: content,
  //   emoji: emoji,
  //   createdAt: createdAt,
  //   isSentByUser: isSentByUser,
  // );
}
