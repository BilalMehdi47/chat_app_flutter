import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/app/chat_app.dart';
import 'main_injection_container.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(
    const ProviderScope(child: ChatApp()),
  );
}



