import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //final TextEditingController _firstNameController = TextEditingController();
  //final TextEditingController _lastNameController = TextEditingController();
  //final TextEditingController _addressController = TextEditingController();
  //final TextEditingController _contactNumberController =
  //  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0081A7),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor:
                        Colors.grey, // Set your desired avatar background color
                    //backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe', // Replace with the actual username
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'john@example.com', // Replace with the actual email ID
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildInfoRow(
                    'First Name',
                    Icons.person,
                    'John', // Replace with your desired first name
                  ),
                  SizedBox(height: 20),
                  buildInfoRow(
                    'Last Name',
                    Icons.person,
                    'Doe', // Replace with your desired last name
                  ),
                  SizedBox(height: 20),
                  buildInfoRow(
                    'Address',
                    Icons.location_on,
                    '123 Main St', // Replace with your desired address
                  ),
                  SizedBox(height: 20),
                  buildInfoRow(
                    'Contact Number',
                    Icons.phone,
                    '+9771234567890', // Replace with your desired contact number
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, IconData icon, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
