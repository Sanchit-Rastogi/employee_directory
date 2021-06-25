class EmployeeModel {
  String firstName;
  String lastName;
  String mobileNumber;
  String email;
  Gender gender;

  EmployeeModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.gender,
  });
}

enum Gender {
  Male,
  Female,
}
