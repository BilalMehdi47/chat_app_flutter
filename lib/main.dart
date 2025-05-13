import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feature/user/presentation/pages/sign_in.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set default background color to white
        primarySwatch: Colors.indigo, // Customize primary color
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar background color
          iconTheme: IconThemeData(color: Colors.black), // AppBar icon color
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // AppBar title style
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // BottomNavigationBar background color
          selectedItemColor: Colors.indigo, // Selected item color
          unselectedItemColor: Colors.grey, // Unselected item color
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Default text color
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: SignIn(),
    );
  }
}
