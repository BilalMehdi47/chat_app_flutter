import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/feature/user/presentation/pages/sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/costants/state_variables.dart';

part 'signin_controller.g.dart';

@riverpod
class SigninController extends _$SigninController {
  @override
  Future<void> build() async {}

  Future<bool> signin(BuildContext context) async {
    state = const AsyncLoading();

    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    final body = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse('https://famous-anthea-alladin-db67a8f9.koyeb.app/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final token = responseData['data']['access_token'];

        // Cache the token using SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        state = const AsyncData(null); // Success
        return true; // Indicate success
      } else {
        final responseData = jsonDecode(response.body);
        final errorMessage = responseData['errors'][0];

        // Show error in SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );

        state = AsyncError(Exception('Signin failed: $errorMessage'), StackTrace.current);
        return false; // Indicate failure
      }
    } catch (e) {
      // Show generic error in SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: ${e.toString()}')),
      );

      state = AsyncError(e, StackTrace.current);
      return false; // Indicate failure
    }
  }

  Future<void> logout(BuildContext context) async {
    // 1. Remove token
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    // 2. Reset Riverpod state
    ref.read(emailProvider.notifier).state = "";
    ref.read(nameProvider.notifier).state = "";
    ref.read(passwordProvider.notifier).state = "";
  }
}
