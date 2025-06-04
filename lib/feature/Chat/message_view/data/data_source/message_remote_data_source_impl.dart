import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:project/app/costants/state_variables.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/config/token/access_token_handler.dart';
import 'package:project/feature/Chat/message_view/data/data_source/message_remote_data_source.dart';
import 'package:project/feature/Chat/message_view/data/models/chat_detail_model.dart';
import 'package:project/feature/Chat/message_view/data/models/chat_detail_response_model.dart';
import 'package:project/feature/user/data/data_sources/local/user_shared_pref.dart';


class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final http.Client client;

  MessageRemoteDataSourceImpl({ required this.client });

  @override
  Future<Either<ResponseFailure, ChatDetailModel>> fetchChatDetail({
    required String chatGroupId,
    required String limit,
    required String cursor,
  }) async {
    final endpoint =
        "${AppConstant.baseUrl}/chats/$chatGroupId?limit=$limit&cursor=$cursor";

    try {
      // 1. Get stored access token
      String? token = await UserSharedPref.getAccessToken();
      if (token == null) {
        return Left(ResponseFailure("Access token is null"));
      }

      debugPrint("fetchChatDetail token: $token");

      // 2. Perform GET with Bearer header
      final response = await AccessTokenHandler().sendGetRequest(
        endpoint,
        AppConstant.headerBearerOptionWithoutContentType(token),
      );

      debugPrint("fetchChatDetail statusCode: ${response.statusCode}");
      final Map<String, dynamic> jsonBody = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // 3. Parse JSON into ChatDetailResponseModel
        final ChatDetailResponseModel respModel =
        ChatDetailResponseModel.fromJson(jsonBody);

        if (respModel.status.toLowerCase() == "success") {
          return Right(respModel.data);
        } else {
          // API returned failure status
          final msg =
          respModel.message.isNotEmpty ? respModel.message : "Unknown API error";
          return Left(ResponseFailure(msg));
        }
      } else {
        // HTTP error
        final errMsg =
            jsonBody['message'] as String? ?? "Server returned status ${response.statusCode}";
        return Left(ResponseFailure(errMsg));
      }
    } catch (e) {
      debugPrint("fetchChatDetail error: $e");
      return Left(ResponseFailure("$e"));
    }
  }
}


