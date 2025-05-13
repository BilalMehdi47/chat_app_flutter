import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/costants/state_variables.dart';

part 'signup_controller.g.dart';

@riverpod
class SignupController extends _$SignupController {
  @override
  Future<void> build() async {}

  Future<bool> signup(BuildContext context) async {
    state = const AsyncLoading();

    final email = ref.read(emailProvider);
    final name = ref.read(nameProvider);
    final password = ref.read(passwordProvider);

    final body = {
      'email': email,
      'name': name,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse('https://famous-anthea-alladin-db67a8f9.koyeb.app/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final token = responseData['data']['access_token'];
        print(token);
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

        state = AsyncError(Exception('Signup failed: $errorMessage'), StackTrace.current);
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
}
