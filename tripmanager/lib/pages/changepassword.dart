import 'package:flutter/material.dart';

void main() {
  runApp(const ChangePasswordPage());
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0081A7),
          title: const Text('Change Password'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'New Password',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const PasswordField(),
              const SizedBox(height: 20),
              const Text(
                'Confirm Password',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const PasswordField(),
              const SizedBox(height: 10),
              const ErrorText(), // Add the error text widget
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit button functionality
                    // Compare the password fields and show error message if they don't match
                    if (PasswordField.newPassword !=
                        PasswordField.confirmPassword) {
                      ErrorText.showError = true;
                    } else {
                      ErrorText.showError = false;
                      // Passwords match, perform submission logic here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0081A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  static String newPassword = '';
  static String confirmPassword = '';

  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      onChanged: (value) {
        setState(() {
          PasswordField.newPassword = value;
        });
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  static bool showError = false;

  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    if (showError) {
      return const Text(
        'Passwords do not match',
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
      );
    } else {
      return const SizedBox.shrink(); // Hide the error text
    }
  }
}
