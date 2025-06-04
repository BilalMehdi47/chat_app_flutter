import 'chat_detail_model.dart';

class ChatDetailResponseModel {
  final String status;
  final String message;
  final ChatDetailModel data;
  final String? errors;

  ChatDetailResponseModel({
    required this.status,
    required this.message,
    required this.data,
    this.errors,
  });

  factory ChatDetailResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    if (rawData == null || rawData is! Map<String, dynamic>) {
      throw FormatException('Expected non-null Map<String, dynamic> in `data`, but got $rawData');
    }

    return ChatDetailResponseModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: ChatDetailModel.fromJson(rawData as Map<String, dynamic>),
      errors: json['errors'] as String?,
    );
  }
}
