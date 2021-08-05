import 'dart:io';

import 'package:employee_directory/locator.dart';
import 'package:employee_directory/router.dart';
import 'package:flutter/material.dart';

import 'core/services/httpOverride.dart';

void main() {
  setupLocator();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Directory',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
