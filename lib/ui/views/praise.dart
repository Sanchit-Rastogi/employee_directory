import 'package:employee_directory/core/models/templates.dart';
import 'package:employee_directory/core/viewModels/praise_model.dart';
import 'package:employee_directory/locator.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PraiseView extends StatefulWidget {
  @override
  _PraiseViewState createState() => _PraiseViewState();
}

class _PraiseViewState extends State<PraiseView> {
  var model = locator<PraiseModel>();

  @override
  void initState() {
    super.initState();
    model.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PraiseModel>(
      create: (_) => model,
      child: Consumer<PraiseModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(
                    model.praiseList.length,
                    (index) {
                      final praise = model.praiseList[index];
                      var temp = kTemplateList.firstWhere(
                          (element) => element.name == praise.title);
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: temp.color.withAlpha(40),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage('assets/${temp.image}'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  praise.sender,
                                  style: kSmallTextStyle,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  size: 15,
                                ),
                                Text(
                                  praise.receiver,
                                  style: kSmallTextStyle,
                                ),
                              ],
                            ),
                            kVerticalSmallSpace,
                            Text(
                              praise.title,
                              style: kSmallBoldTextStyle,
                            ),
                            kVerticalSmallSpace,
                            Text(
                              praise.message,
                              style: kSmallTextStyle,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, 'templates');
              },
              label: Text('New Praise'),
            ),
          );
        },
      ),
    );
  }
}
