import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/viewModels/employees_model.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class EmployeesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeesModel>(
      create: (_) => locator<EmployeesModel>(),
      child: Consumer<EmployeesModel>(
        builder: (context, model, child) {
          return SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search here',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        kHorizontalSmallSpace,
                        Icon(
                          FontAwesomeIcons.search,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  kVerticalMediumSpace,
                  ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: List.generate(
                      model.employeeList.length,
                      (index) {
                        final emp = model.employeeList[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(
                              emp.gender == Gender.Male
                                  ? FontAwesomeIcons.male
                                  : FontAwesomeIcons.female,
                              size: 40,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(emp.firstName + " " + emp.lastName),
                                kVerticalSmallSpace,
                                Text(emp.email),
                              ],
                            ),
                            trailing: Icon(FontAwesomeIcons.arrowRight),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
