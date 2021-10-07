import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/services/databaseHelper.dart';

class Controller {
  final conn = SqfliteDatabaseHelper.instance;

  Future<int?> addEmployee(EmployeeModel employee) async {
    var dbclient = await conn.db;
    int? result;
    try {
      result = await dbclient!
          .insert(SqfliteDatabaseHelper.employeeTable, employee.toJson());
      print("Added - ${employee.firstName}");
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<int?> updateEmployee(EmployeeModel employee) async {
    var dbclient = await conn.db;
    int? result;
    try {
      result = await dbclient!.update(
          SqfliteDatabaseHelper.employeeTable, employee.toJson(),
          where: 'id=?', whereArgs: [employee.id]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<EmployeeModel>> fetchEmployee() async {
    var dbclient = await conn.db;
    List<EmployeeModel> employeeList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
        SqfliteDatabaseHelper.employeeTable,
        orderBy: 'id DESC',
      );
      for (var item in maps) {
        EmployeeModel emp = EmployeeModel.fromJson(item);
        employeeList.add(emp);
      }
    } catch (e) {
      print(e.toString());
    }
    return employeeList;
  }
}
