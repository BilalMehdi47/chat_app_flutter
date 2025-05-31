import 'package:project/feature/Chat/data/model/chat_model.dart';

class ChatResponseModel {
  final String status;
  final String message;
  final List<ChatModel> data;
  final String? error;
  ChatResponseModel({
    required this.status,
    required this.message,
    required this.data,
    this.error,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) => ChatResponseModel(
        status: json['status'] as String,
        message: json['message'] as String,
        data: (json['data'] as List).map((e) => ChatModel.fromJson(e as Map<String, dynamic>)).toList(),
        error: json['error'] as String?,
      );
}
