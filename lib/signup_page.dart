import 'package:flutter/material.dart';
import 'package:full_shopping_app_4/test.dart';
import 'package:go_router/go_router.dart';

import 'auth_regularExp.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  _onPressed() {
    setState(() {
      obscureText = !obscureText;
    });

  }

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    print(" start signup");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    print(" finish signup");
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(color: Color(0xffe4778d)),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 4),
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      "Signup to get started with your App.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "inter",
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -80),
              child: Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.10),
                        blurRadius: 30,
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8f3e4d),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "please enter valid username ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            hintText: "Enter your name",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8f3e4d),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required ";
                            }
                            if (!AuthValidator.emailRegex.hasMatch(
                              value.trim(),
                            )) {
                              return 'Please enter a valid email address';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8f3e4d),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password is required ";
                            }
                            if (!AuthValidator.passwordRegex.hasMatch(
                              value.trim(),
                            )) {
                              return 'Password must contain at least 8 characters, '
                                  'an uppercase letter, a lowercase letter, '
                                  'a number, and a special character';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _onPressed,
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8f3e4d),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: obscureText,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Confirmed Password is required ";
                            }
                            if (value.trim() !=
                                _passwordController.text.trim()) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _onPressed,
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                            ),
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffe4778d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Database.username = _usernameController.text
                                      .trim();
                                  Database.password = _passwordController.text;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("you signup successfully"),
                                    ),
                                  );
                                  context.pop();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: Color(0xffe4778d),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an Account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                               context.pop();
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  color: Color(0xff8f3e4d),
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
