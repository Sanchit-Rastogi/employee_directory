import 'package:employee_directory/core/services/apiService.dart';
import 'package:employee_directory/core/services/userService.dart';
import 'package:employee_directory/core/viewModels/addEmployee_model.dart';
import 'package:employee_directory/core/viewModels/createPraiseViewModel.dart';
import 'package:employee_directory/core/viewModels/praise_model.dart';
import 'package:get_it/get_it.dart';

import 'core/viewModels/employeeProfile_model.dart';
import 'core/viewModels/employees_model.dart';
import 'core/viewModels/landing_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => APIService());
  locator.registerLazySingleton(() => UserService());

  locator.registerFactory(() => LandingModel());
  locator.registerFactory(() => EmployeesModel());
  locator.registerFactory(() => EmployeeProfileModel());
  locator.registerFactory(() => AddEmployeeModel());
  locator.registerFactory(() => PraiseModel());
  locator.registerFactory(() => CreatePraiseViewModel());
}
