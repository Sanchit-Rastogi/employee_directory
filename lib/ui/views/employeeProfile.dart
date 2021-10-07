import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/models/screenArgs.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class EmployeeProfile extends StatefulWidget {
  final EmployeeModel selectedEmployee;
  EmployeeProfile({required this.selectedEmployee});

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'addEmployee',
                arguments: ScreenArguments(arg: widget.selectedEmployee),
              );
            },
            child: Icon(Icons.edit),
          ),
          kHorizontalSmallSpace,
        ],
      ),
      body: Container(
        width: size.width,
        child: Column(
          children: [
            kVerticalMediumSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: widget.selectedEmployee.gender == Gender.Male
                      ? AssetImage('assets/icon-male-inactive.png')
                      : AssetImage('assets/icon-female-inactive.png'),
                  width: 100,
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.selectedEmployee.firstName +
                          ' ' +
                          widget.selectedEmployee.lastName,
                      style: kMediumTextStyle,
                    ),
                    Text(
                      'Intern',
                      style: kSmallTextStyle,
                    ),
                    kVerticalMediumSpace,
                    Row(
                      children: [
                        Icon(Icons.phone),
                        kHorizontalSmallSpace,
                        kHorizontalSmallSpace,
                        Icon(Icons.mail),
                        kHorizontalSmallSpace,
                        kHorizontalSmallSpace,
                        Icon(Icons.message),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            kVerticalMediumSpace,
            kVerticalMediumSpace,
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.tealAccent[50],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Manager', style: kSmallBoldTextStyle),
                          kVerticalSmallSpace,
                          kVerticalSmallSpace,
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Text("RN"),
                              ),
                              kHorizontalSmallSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rangu Naveen',
                                    style: kSmallBoldTextStyle,
                                  ),
                                  Text('Associate Engineering Manager'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
