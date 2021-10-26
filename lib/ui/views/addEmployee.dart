import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/viewModels/addEmployee_model.dart';
import 'package:employee_directory/locator.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddEmployeeView extends StatefulWidget {
  final EmployeeModel selectedEmployee;
  AddEmployeeView({required this.selectedEmployee});

  @override
  _AddEmployeeViewState createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  var model = locator<AddEmployeeModel>();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _gender = TextEditingController();

  @override
  void initState() {
    _firstName.text = widget.selectedEmployee.firstName;
    _lastName.text = widget.selectedEmployee.lastName;
    _mobileNumber.text = widget.selectedEmployee.phoneNumber;
    _email.text = widget.selectedEmployee.email;
    _gender.text =
        widget.selectedEmployee.gender == Gender.Male ? 'Male' : 'Female';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddEmployeeModel>(
      create: (_) => model,
      child: Consumer<AddEmployeeModel>(
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: widget.selectedEmployee.firstName != ''
                  ? Text('Edit Employee')
                  : Text('Add Employee'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kVerticalMediumSpace,
                  Image(
                    image: AssetImage('assets/new_user.png'),
                    width: 100,
                    height: 100,
                  ),
                  kVerticalMediumSpace,
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _firstName,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(
                              FontAwesomeIcons.idBadge,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        kVerticalSmallSpace,
                        TextFormField(
                          controller: _lastName,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(
                              FontAwesomeIcons.idBadge,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        kVerticalSmallSpace,
                        TextFormField(
                          controller: _mobileNumber,
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            prefixIcon: Icon(
                              FontAwesomeIcons.mobileAlt,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        kVerticalSmallSpace,
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        kVerticalSmallSpace,
                        TextFormField(
                          controller: _gender,
                          decoration: InputDecoration(
                            hintText: 'Gender',
                            prefixIcon: Icon(
                              FontAwesomeIcons.venus,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        kVerticalMediumSpace,
                        Container(
                          width: 400,
                          height: 50,
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
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextButton(
                            onPressed: () {
                              model.editEmployee(
                                EmployeeModel(
                                  id: widget.selectedEmployee.id,
                                  firstName: _firstName.text,
                                  lastName: _lastName.text,
                                  phoneNumber: _mobileNumber.text,
                                  email: _email.text,
                                  gender: _gender.text == 'Male'
                                      ? Gender.Male
                                      : Gender.Female,
                                  seniorId: 0,
                                  juniorsId: [],
                                ),
                              );
                              Navigator.pushReplacementNamed(context, '/');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
