import 'package:employee_directory/core/models/templates.dart';
import 'package:employee_directory/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CreatePraiseViewModel extends ChangeNotifier {
  Template praiseTemplate = Template(
    image: 'thank_you.png',
    name: 'Thank You',
    color: kTemplateBlueColor,
  );

  String employeeName = '';

  void updateName(String name) {
    employeeName = name;
    notifyListeners();
  }

  void updateTheme(Color color) {
    praiseTemplate.color = color;
    notifyListeners();
  }

  void updateTemplate(Template template) {
    praiseTemplate = template;
    notifyListeners();
  }
}
