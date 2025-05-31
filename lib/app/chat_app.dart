import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/NavBar/presentation/page/navigation_bar.dart';
import 'package:project/feature/user/presentation/pages/sign_in.dart';
import 'package:project/feature/user/presentation/pages/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../feature/user/presentation/riverpod/controller/auth_controller.dart';

class ChatApp extends ConsumerWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, __) {
        final auth = ref.watch(authControllerProvider);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.indigo,
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.grey,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
            listTileTheme: const ListTileThemeData(
              tileColor: Colors.white,
            ),
          ),
          home: auth.when(
            data: (user) {
              return (user != null && user.token!.isNotEmpty) ? const BottomNavBar() : SignInPage();
            },
            loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (_, __) => SignUp(),
          ),
        );
      },
    );
  }
}
