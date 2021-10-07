import 'dart:convert';

import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/models/praise.dart';
import 'package:http/http.dart' as http;

class APIService {
  String employeeUrl = 'https://localhost:5001/api/Employee';
  String praiseUrl = 'https://localhost:5001/api/Praise';

  Future<List<EmployeeModel>> getEmployee() async {
    print('Getting employees');
    var res = await http.get(Uri.parse(employeeUrl));
    return (json.decode(res.body) as List)
        .map((i) => EmployeeModel.fromJson(i))
        .toList();
  }

  Future<List<Praise>> getPraise() async {
    print('Getting praise');
    var res = await http.get(Uri.parse(praiseUrl));
    return (json.decode(res.body) as List)
        .map((i) => Praise.fromJson(i))
        .toList();
  }

  Future addEmployee(EmployeeModel emp) async {
    print(jsonEncode(emp.toJson()));
    emp.id = 0;
    try {
      await http.post(
        Uri.parse(employeeUrl),
        body: jsonEncode(emp.toJson()),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future sendPraise(Praise praise) async {
    print(jsonEncode(praise.toJson()));
    praise.id = 0;
    try {
      await http.post(
        Uri.parse(praiseUrl),
        body: jsonEncode(praise.toJson()),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future updateEmployee(EmployeeModel emp) async {
    await http.put(
      Uri.parse(employeeUrl + '/${emp.id}'),
      body: jsonEncode(emp.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
