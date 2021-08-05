import 'package:employee_directory/ui/views/addEmployee.dart';
import 'package:employee_directory/ui/views/createPraise.dart';
import 'package:employee_directory/ui/views/landing.dart';
import 'package:employee_directory/ui/views/login.dart';
import 'package:employee_directory/ui/views/previewPraise.dart';
import 'package:employee_directory/ui/views/templates.dart';
import 'package:flutter/material.dart';

import 'core/models/screenArgs.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'templates':
        return MaterialPageRoute(builder: (_) => TemplatesView());
      case 'createPraise':
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (_) => CreatePraiseView(
                  selectedTemplate: args.arg,
                ));
      case 'previewPraise':
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => PreviewPraiseView(
            praisePreview: args.arg,
          ),
        );
      case 'addEmployee':
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => AddEmployeeView(
            selectedEmployee: args.arg,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route exists with name ${settings.name}"),
            ),
          );
        });
    }
  }
}
