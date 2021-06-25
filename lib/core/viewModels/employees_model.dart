import 'package:employee_directory/core/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeesModel extends ChangeNotifier {
  List<EmployeeModel> employeeList = [
    EmployeeModel(
      firstName: 'Akshay',
      lastName: 'Kumar',
      mobileNumber: '1234567890',
      email: 'Akshay.sole@gmail.com',
      gender: Gender.Male,
    ),
    EmployeeModel(
      firstName: 'Prasanthi',
      lastName: 'Y',
      mobileNumber: '1234567890',
      email: 'PrasanthiY@gmail.com',
      gender: Gender.Female,
    ),
    EmployeeModel(
      firstName: 'Mini',
      lastName: 'Bhutani',
      mobileNumber: '1234567890',
      email: 'mini@gmail.com',
      gender: Gender.Female,
    ),
    EmployeeModel(
      firstName: 'Inder',
      lastName: 'Singh',
      mobileNumber: '1234567890',
      email: 'Tezt@gmail.com',
      gender: Gender.Male,
    ),
    EmployeeModel(
      firstName: 'Prasanthi',
      lastName: 'Test',
      mobileNumber: '1234567890',
      email: 'ptest@gmail.com',
      gender: Gender.Female,
    ),
    EmployeeModel(
      firstName: 'Suguna',
      lastName: 'Sole',
      mobileNumber: '1234567890',
      email: 'Suguna@gmail.com',
      gender: Gender.Female,
    ),
  ];
}
