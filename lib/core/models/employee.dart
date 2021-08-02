import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class EmployeeModel {
  int? id = 0;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  Gender gender;

  EmployeeModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.gender,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

}

enum Gender {
  Male,
  Female,
}
