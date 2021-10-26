import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/models/screenArgs.dart';
import 'package:employee_directory/core/viewModels/employeeProfile_model.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphview/GraphView.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class EmployeeProfile extends StatefulWidget {
  final EmployeeModel selectedEmployee;
  EmployeeProfile({required this.selectedEmployee});

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  var model = locator<EmployeeProfileModel>();

  Widget rectangleWidget(int a) {
    EmployeeModel emp =
        model.employeeList.firstWhere((element) => element.id == a);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          'employeeProfile',
          arguments: ScreenArguments(arg: emp),
        );
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: Colors.blue, spreadRadius: 1),
          ],
        ),
        child: Text(emp.firstName + ' ' + emp.lastName),
      ),
    );
  }

  @override
  void initState() {
    model.createGraph(widget.selectedEmployee);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<EmployeeProfileModel>(
      create: (_) => model,
      child: Consumer<EmployeeProfileModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kVerticalMediumSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.network(
                        'https://avatars.dicebear.com/api/personas/${widget.selectedEmployee.firstName + '-' + widget.selectedEmployee.gender.toString()}.svg',
                        height: 100,
                        width: 100,
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
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent[50],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  kVerticalMediumSpace,
                  Text(
                    'Oranisation Tree',
                    style: kMediumTextStyle,
                  ),
                  kVerticalMediumSpace,
                  Expanded(
                    child: InteractiveViewer(
                      constrained: false,
                      boundaryMargin: EdgeInsets.all(20),
                      minScale: 1,
                      maxScale: 1,
                      child: GraphView(
                        graph: model.graph,
                        algorithm: BuchheimWalkerAlgorithm(
                          model.builder,
                          TreeEdgeRenderer(model.builder),
                        ),
                        paint: Paint()
                          ..color = Colors.green
                          ..strokeWidth = 1
                          ..style = PaintingStyle.stroke,
                        builder: (Node node) {
                          var a = node.key!.value as int;
                          return rectangleWidget(a);
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
