import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/services/apiService.dart';
import 'package:employee_directory/core/services/controller.dart';
import 'package:employee_directory/core/services/syncronize.dart';
import 'package:employee_directory/locator.dart';
import 'package:flutter/material.dart';

class EmployeesModel extends ChangeNotifier {
  Controller controller = Controller();

  List<EmployeeModel> employeeList = [
    EmployeeModel(
      id: 1,
      firstName: 'Akshay',
      lastName: 'Kumar',
      phoneNumber: '1234567890',
      email: 'Akshay.sole@gmail.com',
      gender: Gender.Male,
      seniorId: 2,
      juniorsId: [4, 5],
    ),
    EmployeeModel(
      id: 2,
      firstName: 'Prasanthi',
      lastName: 'Y',
      phoneNumber: '1234567890',
      email: 'PrasanthiY@gmail.com',
      gender: Gender.Female,
      seniorId: 0,
      juniorsId: [1, 3],
    ),
    EmployeeModel(
      id: 3,
      firstName: 'Mini',
      lastName: 'Bhutani',
      phoneNumber: '1234567890',
      email: 'mini@gmail.com',
      gender: Gender.Female,
      seniorId: 2,
      juniorsId: [6],
    ),
    EmployeeModel(
      id: 4,
      firstName: 'Inder',
      lastName: 'Singh',
      phoneNumber: '1234567890',
      email: 'Tezt@gmail.com',
      gender: Gender.Male,
      seniorId: 1,
      juniorsId: [],
    ),
    EmployeeModel(
      id: 5,
      firstName: 'Sunny',
      lastName: 'Test',
      phoneNumber: '1234567890',
      email: 'ptest@gmail.com',
      gender: Gender.Female,
      seniorId: 1,
      juniorsId: [],
    ),
    EmployeeModel(
      id: 6,
      firstName: 'Suguna',
      lastName: 'Sole',
      phoneNumber: '1234567890',
      email: 'Suguna@gmail.com',
      gender: Gender.Female,
      seniorId: 3,
      juniorsId: [],
    ),
  ];

  void onInit() async {
    bool res = await SyncData.isInternet();
    if (res) {
      //print('comming from api');
      // ignore: unused_local_variable
      var api = locator<APIService>();
      //employeeList = await api.getEmployee();
    } else {
      print('comming from db');
      Controller controller = Controller();
      employeeList = await controller.fetchEmployee();
    }
    notifyListeners();
  }
}
