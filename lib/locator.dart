import 'package:get_it/get_it.dart';

import 'core/viewModels/employees_model.dart';
import 'core/viewModels/landing_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => LandingModel());
  locator.registerFactory(() => EmployeesModel());
}
