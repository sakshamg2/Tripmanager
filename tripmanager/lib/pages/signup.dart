import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import '../route/routes_names.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final TextEditingController usernameController = TextEditingController();

    _handleTap() async {
      if (_formKey.currentState!.validate()) {
        var headers = {'Content-Type': 'application/json'};
        var url = Uri.parse('http://127.0.0.1:8000/api/user/register/');

        var body = json.encode({
          "email": emailController.text,
          "username": usernameController.text,
          "password": passwordController.text,
          "confirm_password": confirmPasswordController.text
        });

        http.Response response =
            await http.post(url, headers: headers, body: body);
        dynamic jsonResponse = jsonDecode(response.body);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          // Decode the response JSON
          print(jsonResponse);

          Navigator.pushNamed(context, RoutesName.loginRoute);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                jsonResponse['msg'],
              ),
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0081A7),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length < 5) {
                              return "Username must be greater than 5";
                            }
                          },
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: 'User Name',
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
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter email";
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
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
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Password must be greater than 8";
                      }
                    },
                    obscureText: true,
                    controller: passwordController,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Password must be greater than 8";
                      }
                    },
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0081A7),
                  ),
                  onPressed: () {
                    _handleTap();
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF0081A7),
                    ),
                    children: [
                      TextSpan(
                        text: "Login.",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0081A7),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RoutesName.loginRoute);
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
