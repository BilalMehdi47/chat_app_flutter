//
//
// import 'package:http/http.dart' as http;
// import '../../feature/user/data/data_sources/local/user_shared_pref.dart';
//
// class AccessTokenHandler {
//   AccessTokenHandler._internal();
//
//   static final AccessTokenHandler instance = AccessTokenHandler._internal();
//
//   factory AccessTokenHandler() {
//     return instance;
//   }
//
//   Future<String?> getAccessToken() async => UserSharedPref.getAccessToken();
//
//   Future<http.Response> sendPostRequest(
//       String endPoint, Map<String, String> headers, {String? body}) async {
//     // Attempt the initial POST request
//     var response =
//     await http.post(Uri.parse(endPoint), headers: headers, body: body);
//
//     // Check if the response status code is 401 (Unauthorized)
//     if (response.statusCode == 401 || response.statusCode == 500) {
//       // Refresh the access token
//       await refreshAccessToken();
//       // Update the headers with the new access token
//       String? newAccessToken = await AccessTokenHandler().getAccessToken();
//       headers['Authorization'] = 'Bearer $newAccessToken';
//
//       // Resend the POST request with the new access token
//       response =
//       await http.post(Uri.parse(endPoint), headers: headers, body: body);
//     }
//
//     return response;
//   }
//
//   Future<http.Response> sendPostRequestWithoutBody(
//       String endPoint, Map<String, String> headers) async {
//     // Attempt the initial POST request without a body
//     var response = await http.post(Uri.parse(endPoint), headers: headers);
//
//     // // Check if the response status code is 401 (Unauthorized)
//     // if (response.statusCode == 401 || response.statusCode == 500) {
//     //   // Refresh the access token
//     //   await refreshAccessToken();
//     //   // Update the headers with the new access token
//     //   String? newAccessToken = await AccessTokenHandler().getAccessToken();
//     //   headers['Authorization'] = 'Bearer $newAccessToken';
//     //
//     //   // Resend the POST request with the new access token
//     //   response = await http.post(Uri.parse(endPoint), headers: headers);
//     // }
//
//     return response;
//   }
//
//   Future<http.Response> sendPutRequest(
//       String endPoint, Map<String, String> headers, dynamic body) async {
//     // Attempt the initial PUT request
//     var response =
//     await http.put(Uri.parse(endPoint), headers: headers, body: body);
//
//     // Check if the response status code is 401 (Unauthorized)
//     if (response.statusCode == 401 || response.statusCode == 500) {
//       // Refresh the access token
//       await refreshAccessToken();
//       // Update the headers with the new access token
//       String? newAccessToken = await AccessTokenHandler().getAccessToken();
//       headers['Authorization'] = 'Bearer $newAccessToken';
//
//       // Resend the PUT request with the new access token
//       response =
//       await http.put(Uri.parse(endPoint), headers: headers, body: body);
//     }
//
//     return response;
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../feature/user/data/data_sources/local/user_shared_pref.dart';

class AccessTokenHandler {
  AccessTokenHandler._internal();

  static final AccessTokenHandler instance = AccessTokenHandler._internal();

  factory AccessTokenHandler() {
    return instance;
  }

  Future<String?> getAccessToken() async => UserSharedPref.getAccessToken();

  Future<http.Response> sendPostRequest(String endPoint, Map<String, String> headers, {String? body}) async {
    // Add the access token to the headers
    String? accessToken = await getAccessToken();
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    // Send the POST request
    return await http.post(Uri.parse(endPoint), headers: headers, body: body);
  }

  Future<http.Response> sendPostRequestWithoutBody(String endPoint, Map<String, String> headers) async {
    // Add the access token to the headers
    String? accessToken = await getAccessToken();
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    // Send the POST request without a body
    return await http.post(Uri.parse(endPoint), headers: headers);
  }

  Future<http.Response> sendPutRequest(String endPoint, Map<String, String> headers, dynamic body) async {
    // Add the access token to the headers
    String? accessToken = await getAccessToken();
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    // Send the PUT request
    return await http.put(Uri.parse(endPoint), headers: headers, body: body);
  }
}
