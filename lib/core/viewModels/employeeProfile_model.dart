import 'package:employee_directory/core/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import '../../locator.dart';
import 'employees_model.dart';

class EmployeeProfileModel extends ChangeNotifier {
  var employeeList = locator<EmployeesModel>().employeeList;

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  void createGraph(EmployeeModel selectedEmployee) {
    final empNode = Node.Id(selectedEmployee.id);
    if (selectedEmployee.seniorId != 0) {
      final seniorNode = Node.Id(selectedEmployee.seniorId);
      graph.addEdge(seniorNode, empNode);
    }
    if (selectedEmployee.juniorsId.length > 0) {
      int juniors = selectedEmployee.juniorsId.length;
      for (int i = 1; i <= juniors; i++) {
        final juniorNode = Node.Id(selectedEmployee.juniorsId[i - 1]);
        graph.addEdge(empNode, juniorNode);
      }
    }
    builder
      ..siblingSeparation = (50)
      ..levelSeparation = (50)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
