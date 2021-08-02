import 'package:employee_directory/ui/views/employees.dart';
import 'package:employee_directory/ui/views/praise.dart';
import 'package:flutter/material.dart';

class LandingModel extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    EmployeesView(),
    PraiseView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
