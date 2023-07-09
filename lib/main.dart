import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripmanager/route/routes.dart';
import 'package:tripmanager/route/routes_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.splashRoute,
      onGenerateRoute: Routes.generatesRoutes,
    );
  }
}
