import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:project/app/costants/state_variables.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/data/data_source/remote/remote_data_source.dart';
import 'package:project/feature/Chat/data/model/chat_model.dart';
import 'package:project/feature/Chat/data/model/chat_response_model.dart';
import 'package:project/config/token/access_token_handler.dart';
import 'package:project/feature/user/data/data_sources/local/user_shared_pref.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client client;

  ChatRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<ResponseFailure, List<ChatModel>>> fetchUserChats() async {
    final String endpoint = "${AppConstant.baseUrl}/chats";

    try {
      // First, fetch stored access token
      String? accessToken = await UserSharedPref.getAccessToken();
      if (accessToken == null) {
        return Left(ResponseFailure("Access token is null"));
      }

      debugPrint("fetchUserChats token: $accessToken");

      // Use AccessTokenHandler to attach bearer and send GET
      final response = await AccessTokenHandler()
          .sendGetRequest(endpoint, AppConstant.headerBearerOptionWithoutContentType(accessToken));

      debugPrint("fetchUserChats statusCode: ${response.statusCode}");
      final Map<String, dynamic> jsonBody = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final ChatResponseModel responseModel =
        ChatResponseModel.fromJson(jsonBody);
        if (responseModel.status.toLowerCase() == "success") {
          return Right(responseModel.data);
        } else {
          // API-level error
          final msg =
          responseModel.message.isNotEmpty
              ? responseModel.message
              : "Unknown API error";
          return Left(ResponseFailure(msg));
        }
      } else {
        // HTTP-level error
        final errorMsg =
            jsonBody['message'] as String? ?? "Server returned error";
        return Left(ResponseFailure(errorMsg));
      }
    } catch (e) {
      debugPrint("fetchUserChats error: $e");
      return Left(ResponseFailure("$e"));
    }
  }
}
