import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/user/data/models/signin/signin_controller.dart';
import 'package:project/feature/user/presentation/pages/sign_up.dart';
import '../../../NavBar/presentation/page/navigation_bar.dart';
import '../../../app/costants/state_variables.dart';
import '../widgets/form_field_widget.dart';

class SignIn extends ConsumerWidget {
  SignIn({super.key});

  static const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signinState = ref.watch(signinControllerProvider);
    final signinController = ref.read(signinControllerProvider.notifier);

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
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
                          hintText: 'Enter your email',
                          controller: emailController,
                          onChanged: (val) => ref.read(emailProvider.notifier).state = val,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        FormFieldWidget(
                          label: "Password",
                          hintText: 'Enter your password',
                          controller: passwordController,
                          onChanged: (val) => ref.read(passwordProvider.notifier).state = val,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 150),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            padding: EdgeInsets.only(bottom: 12, top: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final result = await signinController.signin(context);
                              if (result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Signed In!")),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BottomNavBar()),
                                );
                              }
                            }
                          },
                          child: Center(
                            child: signinState is AsyncLoading
                                ? const CircularProgressIndicator()
                                : Text(
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
      ),
    );
  }
}
