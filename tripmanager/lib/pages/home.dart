import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripmanager/model/recommendation.dart';
import 'package:tripmanager/pages/feed.dart';
import 'package:get/get.dart';
import 'package:tripmanager/pages/recommendation_details.dart';
import 'package:tripmanager/pages/setting.dart';
import 'package:tripmanager/pages/help.dart';
import '../route/routes_names.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _queryController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RecommendationResponse? recommendation;
  bool isFetchingRecommendations = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      persistentFooterButtons: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _queryController,
              decoration: InputDecoration(
                hintText: 'Search..',
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(color: Color(0xFF0081A7)),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send_sharp),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isFetchingRecommendations = true;
                      });
                      var url = Uri.parse(
                          'http://127.0.0.1:8000/api/recommendation/recommendations/');

                      var body = json.encode({
                        "query": _queryController.text,
                      });
                      var prefs = await SharedPreferences.getInstance();
                      final token = prefs.getString('token');
                      http.Response response = await http.post(
                        url,
                        headers: {
                          'Authorization': 'Bearer $token',
                          'Content-Type': 'application/json'
                        },
                        body: body,
                      );
                      dynamic jsonResponse = jsonDecode(response.body);
                      if (response.statusCode >= 200 &&
                          response.statusCode < 300) {
                        RecommendationResponse recommendationResponse =
                            RecommendationResponse.fromJson(jsonResponse);
                        setState(() {
                          recommendation = recommendationResponse;
                        });
                      }
                      setState(() {
                        isFetchingRecommendations = false;
                      });
                    }
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF0081A7),
                    )),
              ),
            ),
          ),
        ),
      ],
      appBar: AppBar(
        backgroundColor: const Color(0xFF0081A7),
        title: const Text(
          'TripManager',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // TODO: Display current user profile and options
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Builder(builder: (context) {
                if (isFetchingRecommendations) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (recommendation == null) {
                  return const Center(child: Text('Try searching'));
                }
                return ListView.builder(
                  itemCount: recommendation!.recommendations.length,
                  itemBuilder: (context, index) {
                    final recommend = recommendation!.recommendations[index];
                    return ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              RecommendationDetails(recommendation: recommend),
                        ),
                      ),
                      title: Text(recommend.name),
                      subtitle: Text(recommend.description, maxLines: 3),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0081A7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150x150.png?text=User'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context,
                    RoutesName.homeRoute); // TODO: Navigate to Home page
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context,
                    RoutesName.profileRoute); //TODO: Navigate to Profile page
              },
            ),
            ListTile(
              leading: const Icon(Icons.post_add, color: Colors.black),
              title: const Text('Post'),
              onTap: () {
                Navigator.pushNamed(context,
                    RoutesName.postRoute); // TODO: Navigate to Post page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () {
                Get.to(const SettingsPage()); // TODO: Navigate to Settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.black),
              title: const Text('Help'),
              onTap: () {
                Get.to(const HelpPage()); // TODO: Navigate to Help page
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback, color: Colors.black),
              title: const Text('Feedback'),
              onTap: () {
                Get.to(const FeedbackPage()); //TODO: Navigate to Profile page
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.loginRoute);
                // TODO: Perform Logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
