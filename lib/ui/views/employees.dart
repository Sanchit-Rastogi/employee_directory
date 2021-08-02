import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/models/screenArgs.dart';
import 'package:employee_directory/core/viewModels/employees_model.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class EmployeesView extends StatefulWidget {
  @override
  _EmployeesViewState createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView> {
  var model = locator<EmployeesModel>();

  @override
  void initState() {
    model.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeesModel>(
      create: (_) => model,
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
                  Expanded(
                    flex: 1,
                    child: ListView(
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
                              leading: Image(
                                image: emp.gender == Gender.Male
                                    ? AssetImage(
                                        'assets/icon-male-inactive.png')
                                    : AssetImage(
                                        'assets/icon-female-inactive.png'),
                                width: 40,
                                height: 40,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(emp.firstName + " " + emp.lastName),
                                  kVerticalSmallSpace,
                                  Text(emp.email),
                                ],
                              ),
                              trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'addEmployee',
                                      arguments: ScreenArguments(arg: emp),
                                    );
                                  },
                                  child: Icon(FontAwesomeIcons.arrowRight)),
                            ),
                          );
                        },
                      ),
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
