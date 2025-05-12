import 'package:flutter/material.dart';

import '../widgets/form_field_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // Dismiss the keyboard
            },
            child: Scaffold(body: _bodyWidget())));
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
      child: Form(
        key: _formKey,
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
                    label: "Name",
                    hintText: 'Enter your name',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      // } else if (value.length < 6) {
                      //   return 'Name must be at least  characters';
                      // }
                    },
                  ),
                  SizedBox(height: 10),
                  FormFieldWidget(
                    label: "Email",
                    hintText: 'Enter your email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      // } else if (!RegExp(emailRegex).hasMatch(value)) {
                      //   return 'Enter a valid email';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  FormFieldWidget(
                    label: "Password",
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      // } else if (value.length < 8) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      child: ElevatedButton(
                        // Set text color to white
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
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
                  "Already have an account?",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, PageConst.signInPage);
                  },
                  child: Text('Log in', style: TextStyle(fontSize: 18, color: Colors.indigoAccent)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
