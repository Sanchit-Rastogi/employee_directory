import 'dart:io';

import 'package:employee_directory/locator.dart';
import 'package:employee_directory/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/services/httpOverride.dart';

void main() {
  setupLocator();
  HttpOverrides.global = MyHttpOverrides();
  configLoading();
  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Directory',
      builder: EasyLoading.init(),
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
