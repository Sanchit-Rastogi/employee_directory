import 'package:employee_directory/ui/views/employees.dart';
import 'package:flutter/material.dart';

class LandingModel extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    EmployeesView(),
    Text(
      'Index 2: Praise',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
