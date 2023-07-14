import 'package:flutter/material.dart';
import 'package:tripmanager/route/routes_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splashscreen.png'),
              const Text(
                'Trip Manager',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0081A7),
                ),
              ),
              const SizedBox(height: 50.0),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Personalized Tourist Place Recommendation\nUsing Machine Learning',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF0081A7),
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.loginRoute);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0081A7),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
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
