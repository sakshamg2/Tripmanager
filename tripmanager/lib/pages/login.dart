import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tripmanager/model/user_response.dart';
import 'package:tripmanager/shared_preferences.dart';
import '../route/routes_names.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _handleTap() async {
    if (_formKey.currentState!.validate()) {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://127.0.0.1:8000/api/user/login/');

      var body = json.encode({
        "email": _emailController.text,
        "password": _passwordController.text,
      });

      http.Response response =
          await http.post(url, headers: headers, body: body);
      dynamic jsonResponse = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        LoginResponse loginResponse = LoginResponse.fromJson(jsonResponse);
        setToken(loginResponse.token.access);
        setUserId(loginResponse.user.id);

        Navigator.pushNamed(context, RoutesName.homeRoute);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loginResponse.msg),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print(response.reasonPhrase);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              jsonResponse['errors'].toString(),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splashscreen.png', //  app logo image
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Log in',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0081A7),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Color(0xFF0081A7)),
                      labelStyle: TextStyle(color: Color(0xFF0081A7)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF0081A7),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Color(0xFF0081A7)),
                      labelStyle: TextStyle(color: Color(0xFF0081A7)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF0081A7),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.forgetpwRoute);
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF0081A7),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0081A7),
                  ),
                  onPressed: () {
                    _handleTap();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF0081A7),
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0081A7),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, RoutesName.signupRoute);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
