import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/services/apiService.dart';
import 'package:employee_directory/locator.dart';
import 'package:flutter/material.dart';

class EmployeesModel extends ChangeNotifier {
  List<EmployeeModel> employeeList = [
    EmployeeModel(
      firstName: 'Akshay',
      lastName: 'Kumar',
      phoneNumber: '1234567890',
      email: 'Akshay.sole@gmail.com',
      gender: Gender.Male,
    ),
    EmployeeModel(
      firstName: 'Prasanthi',
      lastName: 'Y',
      phoneNumber: '1234567890',
      email: 'PrasanthiY@gmail.com',
      gender: Gender.Female,
    ),
    EmployeeModel(
      firstName: 'Mini',
      lastName: 'Bhutani',
      phoneNumber: '1234567890',
      email: 'mini@gmail.com',
      gender: Gender.Female,
    ),
    EmployeeModel(
      firstName: 'Inder',
      lastName: 'Singh',
      phoneNumber: '1234567890',
      email: 'Tezt@gmail.com',
      gender: Gender.Male,
    ),
    EmployeeModel(
      firstName: 'Prasanthi',
      lastName: 'Test',
      phoneNumber: '1234567890',
      email: 'ptest@gmail.com',
      gender: Gender.Female,
    ),
    EmployeeModel(
      firstName: 'Suguna',
      lastName: 'Sole',
      phoneNumber: '1234567890',
      email: 'Suguna@gmail.com',
      gender: Gender.Female,
    ),
  ];

  void onInit() async {
    var api = locator<APIService>();
    employeeList = await api.getEmployee();
    notifyListeners();
  }
}
