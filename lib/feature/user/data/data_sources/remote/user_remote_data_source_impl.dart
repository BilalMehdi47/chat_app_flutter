import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:project/feature/user/data/models/user_model.dart';
import 'package:project/feature/user/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;
import '../../../../../config/token/access_token_handler.dart';
import '../../../../app/costants/state_variables.dart';
import '../local/user_shared_pref.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<ResponseFailure, UserModel>> signUpUser(UserEntity user) async {
    final String endPoint = "${AppConstant.baseUrl}/auth/signup";

    try {
      final response = await client.post(
        Uri.parse(endPoint),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": user.name,
          "email": user.email,
          "password": user.password,
        }),
      );

      print("signUpUser statusCode ${response.statusCode}");

      // Accept any 2xx response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        print("signUpUser responseBody ${response.body}");
        return Right(UserModel.fromJson(responseBody as Map<String, dynamic>));
      } else {
        final responseBody = json.decode(response.body);
        final errorMessage = responseBody['message'] ?? 'Unknown error occurred';
        return Left(ResponseFailure(errorMessage));
      }
    } catch (e) {
      print("signUpUser error: $e");
      return Left(ResponseFailure('$e'));
    }
  }

  @override
  Future<Either<ResponseFailure, UserModel>> signInUser(UserEntity user) async {
    final String endPoint = "${AppConstant.baseUrl}/auth/signin";

    print("URL: ${endPoint}");
    print("loginUser user ${user.email} ${user.password}");

    try {
      final response = await client.post(
        Uri.parse(endPoint),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'email': user.email,
          'password': user.password,
        }),
      );

      print("loginUser statusCode ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        print("loginUser responseBody ${response.body}");
        return Right(UserModel.fromJson(responseBody as Map<String, dynamic>));
      } else {
        final responseBody = json.decode(response.body);
        final errorMessage = responseBody['message'] ?? "Unknown error occurred";
        return Left(ResponseFailure(errorMessage));
      }
    } catch (e) {
      print("loginUser error occur $e");
      return Left(ResponseFailure('$e'));
    }
  }

  @override
  Future<Either<ResponseFailure, String>> signOutUser() async {
    final String endPoint = "${AppConstant.baseUrl}/auth/signout";
    print("End point $endPoint");

    try {
      String? accessToken = await UserSharedPref.getAccessToken();

      if (accessToken == null) {
        return Left(ResponseFailure("Access token is null"));
      }

      print("logoutUser accessToken $accessToken");

      final response = await AccessTokenHandler()
          .sendPostRequestWithoutBody(endPoint, AppConstant.headerBearerOptionWithoutContentType(accessToken));
      final Map<String, dynamic>? responseBody = json.decode(response.body);

      print("logoutUser statusCode ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("logoutUser responseBody ${response.body}");
        final message = responseBody?['data']?['message'] ?? "Sign-out successful";
        return Right(message);
      } else {
        final errorMessage = responseBody?['message'] ?? "Unknown error occurred";
        debugPrint("logoutUser statusCode $responseBody");
        return Left(ResponseFailure("logoutUser FAILED: $errorMessage"));
      }
    } catch (e) {
      print("logoutUser error occur $e");
      return Left(ResponseFailure('$e'));
    }
  }
}
