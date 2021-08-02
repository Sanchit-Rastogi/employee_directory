import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:flutter/material.dart';

class TemplateBox extends StatelessWidget {
  
  final Color colorName;
  final String image;
  final String name;

  TemplateBox({required this.image, required this.colorName, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: colorName.withAlpha(30),
            ),
            margin: EdgeInsets.only(bottom: 20),
            child: Image(
              image: AssetImage('assets/$image'),
            ),
          ),
          Expanded(
            child: Text(
              name,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}