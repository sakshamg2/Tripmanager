import 'package:flutter/material.dart';
import 'package:tripmanager/pages/changepassword.dart';
import 'package:tripmanager/pages/forgetpassword.dart';
import 'package:tripmanager/pages/help.dart';
import 'package:tripmanager/pages/home.dart';
import 'package:tripmanager/pages/login.dart';
import 'package:tripmanager/pages/post.dart';
import 'package:tripmanager/pages/profile.dart';
import 'package:tripmanager/pages/setting.dart';

import 'package:tripmanager/pages/signup.dart';
import 'package:tripmanager/pages/splashscreen.dart';
import 'package:tripmanager/route/routes_names.dart';

class Routes {
  static Route<dynamic> generatesRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case RoutesName.splashRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.signupRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupPage());

      case RoutesName.forgetpwRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgetPasswordPage());

      case RoutesName.changepwRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChangePasswordPage());

      case RoutesName.postRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const PostPage());

      case RoutesName.profileRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfilePage());

      case RoutesName.settingsRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsPage());

      case RoutesName.helpRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const HelpPage());


      case RoutesName.homeRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No routes defined"),
                  ),
                ));
    }
  }
}
