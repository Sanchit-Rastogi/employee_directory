import 'package:employee_directory/core/viewModels/praise_model.dart';
import 'package:employee_directory/locator.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
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
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From - ${praise.sender}',
                              style: kSmallTextStyle,
                            ),
                            kVerticalSmallSpace,
                            Text(
                              'To - ${praise.receiver}',
                              style: kSmallTextStyle,
                            ),
                            kVerticalSmallSpace,
                            Text(
                              'Title - ${praise.title}',
                              style: kSmallTextStyle,
                            ),
                            kVerticalSmallSpace,
                            Text(
                              'Message - ${praise.message}',
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
