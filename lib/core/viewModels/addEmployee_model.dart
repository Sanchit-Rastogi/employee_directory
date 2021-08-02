import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/services/apiService.dart';
import 'package:employee_directory/locator.dart';
import 'package:flutter/material.dart';

class AddEmployeeModel extends ChangeNotifier {
  var _api = locator<APIService>();

  void editEmployee(EmployeeModel emp) async {
    print(emp.firstName);
    if (emp.id != null) {
      print('Updating');
      await _api.updateEmployee(emp);
    } else {
      print('Adding');
      await _api.addEmployee(emp);
    }
  }
}
