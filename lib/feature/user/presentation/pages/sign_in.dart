import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/user/presentation/pages/sign_up.dart';
import '../../../NavBar/presentation/page/navigation_bar.dart';
import '../../../app/costants/state_variables.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../riverpod/controller/auth_controller.dart';
import '../widgets/form_field_widget.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Update controllers with provider values
    emailController.text = ref.watch(emailProvider);
    passwordController.text = ref.watch(passwordProvider);

    // 2. Read auth state and controller
    final authState = ref.watch(authControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);

    // 3. Listen for success or error
    ref.listen<AsyncValue<UserModel?>>(authControllerProvider, (prev, next) {
      next.when(
        data: (user) {
          if (user != null) {
            // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signed in!')));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => BottomNavBar()),
            );
          }
        },
        loading: () {}, // we already show loading indicator
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
        },
      );
    });

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.pie_chart,
                          size: 50,
                          color: Colors.indigoAccent,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Please enter your details.',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FormFieldWidget(
                        label: "Email",
                        hintText: "Enter your email",
                        controller: emailController,
                        onChanged: (v) => ref.read(emailProvider.notifier).state = v,
                        validator: (v) => v!.isEmpty ? 'Email required' : null,
                      ),
                      SizedBox(height: 10),
                      FormFieldWidget(
                        label: "Password",
                        hintText: "Enter your password",
                        controller: passwordController,
                        onChanged: (v) => ref.read(passwordProvider.notifier).state = v,
                        isPassword: true,
                        validator: (v) => v!.isEmpty ? 'Password required' : null,
                      ),
                      const SizedBox(height: 150),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          padding: EdgeInsets.only(bottom: 12, top: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authController.signIn(
                              UserEntity(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: authState is AsyncLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.indigoAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
