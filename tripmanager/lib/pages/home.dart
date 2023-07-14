import 'package:flutter/material.dart';
import 'package:tripmanager/pages/feed.dart';
import 'package:get/get.dart';
import 'package:tripmanager/pages/setting.dart';
import 'package:tripmanager/pages/help.dart';
import '../route/routes_names.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              child: const Center(
                child: Text(
                  'Demo search result',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search..',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Color(0xFF0081A7)),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.send_sharp),
                                    onPressed: () {
                                      // handle send button press
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
                      ),
                    ),
                  ),
                ),
              ],
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
