import 'dart:convert';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route/routes_names.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  _postProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    int? id = prefs.getInt('id');

    if (_formKey.currentState!.validate()) {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse('http://127.0.0.1:8000/api/profile/profiles/');
      var body = json.encode({
        "frist_name": firstNameController.text,
        "last_name": lastNameController.text,
        "address": addressController.text,
        "phone": phoneNumberController.text
      });
      http.Response response =
          await http.post(url, headers: headers, body: body);
      dynamic jsonResponse = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Decode the response JSON
        print(jsonResponse);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0081A7),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'johndoe@example.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    _buildProfileBox(
                        labelText: 'First Name',
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Can't be empty";
                          }
                          return null;
                        },
                        icon: const Icon(Icons.person),
                        // initialValue: 'John',
                        controller: firstNameController),
                    const SizedBox(height: 10),
                    _buildProfileBox(
                        labelText: 'Last Name',
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Can't be empty";
                          }
                          return null;
                        },
                        icon: const Icon(Icons.person),
                        // initialValue: 'Doe',
                        controller: lastNameController),
                    const SizedBox(height: 10),
                    _buildProfileBox(
                        labelText: 'Address',
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Can't be empty";
                          }
                          return null;
                        },
                        icon: const Icon(Icons.location_on),
                        // initialValue: '123 Main St',
                        controller: addressController),
                    const SizedBox(height: 10),
                    _buildProfileBox(
                        labelText: 'Contact',
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Can't be empty";
                          }
                          return null;
                        },
                        icon: const Icon(Icons.phone),
                        // initialValue: '555-1234',
                        controller: phoneNumberController),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _postProfile();
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBox({
    required String labelText,
    required Icon icon,
    required TextEditingController controller,
    required FormFieldValidator validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Color(0xFF0081A7)),
        ),
        prefixIcon: icon,
      ),
      validator: validator,
    );
  }
}
