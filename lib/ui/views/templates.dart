import 'package:employee_directory/core/models/screenArgs.dart';
import 'package:employee_directory/core/models/templates.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/widgets/templateBox.dart';
import 'package:flutter/material.dart';

class TemplatesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praise'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Templates',
              style: kMediumTextStyle,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: kTemplateList.length,
                itemBuilder: (context, index) {
                  var item = kTemplateList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'createPraise',
                        arguments: ScreenArguments(arg: item),
                      );
                    },
                    child: TemplateBox(
                      image: item.image,
                      colorName: item.color,
                      name: item.name,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
