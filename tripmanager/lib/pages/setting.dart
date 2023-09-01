import 'package:flutter/material.dart';
import 'package:tripmanager/pages/history.dart';
import '../route/routes_names.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0081A7),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Account Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF0081A7),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF0081A7),
                        width: 1.0,
                      ),
                    ),
                    child: SettingBox(
                      icon: Icons.lock,
                      title: 'Change Password',
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            RoutesName
                                .changepwRoute); // implement change password functionality
                      },
                    ),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF0081A7),
                        width: 1.0,
                      ),
                    ),
                    child: SettingBox(
                      icon: Icons.history,
                      title: 'History',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const History(),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF0081A7),
                        width: 1.0,
                      ),
                    ),
                    child: SettingBox(
                      icon: Icons.edit,
                      title: 'Edit Profile',
                      onTap: () {
                        // implement edit profile functionality
                      },
                    ),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF0081A7),
                        width: 1.0,
                      ),
                    ),
                    child: SettingBox(
                      icon: Icons.format_paint,
                      title: 'Appearance',
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.appearRoute);
                        // implement email notification functionality
                      },
                    ),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xFF0081A7),
                        width: 1.0,
                      ),
                    ),
                    child: SettingBox(
                      icon: Icons.delete,
                      title: 'Delete Account',
                      onTap: () {
                        // implement delete account functionality
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF0081A7),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 10.0,
              color: Color(0xFF0081A7),
            ),
          ],
        ),
      ),
    );
  }
}
