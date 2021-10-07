import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/models/screenArgs.dart';
import 'package:employee_directory/core/viewModels/landing_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  var model = locator<LandingModel>();

  @override
  void initState() {
    model.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LandingModel>(
      create: (_) => locator<LandingModel>(),
      child: Consumer<LandingModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: model.widgetOptions[model.selectedIndex],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: model.selectedIndex == 1
                ? Container()
                : Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.0, 1.0],
                        colors: [
                          Colors.tealAccent,
                          Colors.blue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'addEmployee',
                          arguments: ScreenArguments(
                            arg: EmployeeModel(
                              firstName: '',
                              lastName: '',
                              phoneNumber: '',
                              email: '',
                              gender: Gender.Male,
                            ),
                          ),
                        );
                      },
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        size: 20,
                      ),
                    ),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.idBadge),
                  label: 'Employees',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.award),
                  label: 'Praise',
                ),
              ],
              currentIndex: model.selectedIndex,
              selectedItemColor: Colors.lightBlueAccent,
              onTap: model.onItemTapped,
            ),
          );
        },
      ),
    );
  }
}
