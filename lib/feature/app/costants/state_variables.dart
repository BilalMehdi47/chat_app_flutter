import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) => '');
final nameProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

class AppConstant {
  AppConstant._internal();

  static final AppConstant _instance = AppConstant._internal(); // Singleton instance

  factory AppConstant() {
    return _instance;
  }

  static const String baseUrl = "https://famous-anthea-alladin-db67a8f9.koyeb.app";

  static Map<String, String> headerBearerOptionWithoutContentType(String token) => {
    'Authorization': 'Bearer $token',
  };

}
