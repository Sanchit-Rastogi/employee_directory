import 'package:employee_directory/core/models/praise.dart';
import 'package:employee_directory/core/models/preview.dart';
import 'package:employee_directory/core/models/screenArgs.dart';
import 'package:employee_directory/core/models/templates.dart';
import 'package:employee_directory/core/viewModels/createPraiseViewModel.dart';
import 'package:employee_directory/ui/shared/colors.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:employee_directory/ui/widgets/templateBox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class CreatePraiseView extends StatefulWidget {
  final Template selectedTemplate;

  CreatePraiseView({required this.selectedTemplate});

  @override
  _CreatePraiseViewState createState() => _CreatePraiseViewState();
}

class _CreatePraiseViewState extends State<CreatePraiseView> {
  final model = locator<CreatePraiseViewModel>();

  TextEditingController _name = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _message = TextEditingController();

  @override
  void initState() {
    model.praiseTemplate = widget.selectedTemplate;
    _title.text = widget.selectedTemplate.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreatePraiseViewModel>(
      create: (_) => model,
      child: Consumer<CreatePraiseViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Praise'),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: model.praiseTemplate.color.withAlpha(30),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/${model.praiseTemplate.image}'),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (contex) {
                                    return Container(
                                      height: size.height * 0.3,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Suggestions for you',
                                                  style: kSmallTextStyle,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Done',
                                                    style: TextStyle(
                                                      color: model
                                                          .praiseTemplate.color,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (contex, index) {
                                                var item = kTemplateList[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    model.updateTemplate(item);
                                                  },
                                                  child: Container(
                                                    height: size.height * 0.25,
                                                    width: size.width * 0.3,
                                                    child: TemplateBox(
                                                      image: item.image,
                                                      colorName: item.color,
                                                      name: item.name,
                                                    ),
                                                  ),
                                                );
                                              },
                                              itemCount: kTemplateList.length,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  border: Border.all(
                                    color: model.praiseTemplate.color,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.pen,
                                  size: 18,
                                  color: model.praiseTemplate.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              model.praiseTemplate.name,
                              style: kSmallBoldTextStyle,
                            ),
                            kVerticalSmallSpace,
                            Text(
                              model.employeeName,
                              style: TextStyle(
                                color: model.praiseTemplate.color,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            kVerticalMediumSpace,
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kVerticalMediumSpace,
                        Text('Select Employeee', style: kSmallTextStyle),
                        kVerticalSmallSpace,
                        TextField(
                          controller: _name,
                          onChanged: (value) {
                            model.updateName(_name.text);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black54),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black87),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            hintText: 'Employee Name',
                          ),
                        ),
                        kVerticalMediumSpace,
                        Text('Praise', style: kSmallTextStyle),
                        kVerticalSmallSpace,
                        TextField(
                          controller: _title,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black54),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black87),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            hintText: 'Praise Title',
                          ),
                        ),
                        kVerticalMediumSpace,
                        TextField(
                          controller: _message,
                          maxLines: 5,
                          minLines: 5,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black54),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black87),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            hintText: 'Praise Message',
                          ),
                        ),
                        kVerticalMediumSpace,
                        Text('Choose background theme', style: kSmallTextStyle),
                        kVerticalSmallSpace,
                        Container(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var box = kColors[index];
                              return GestureDetector(
                                onTap: () {
                                  model.updateTheme(box);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                        color: box.withAlpha(40),
                                      ),
                                    ),
                                    model.praiseTemplate.color == box
                                        ? Container(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              FontAwesomeIcons.check,
                                              size: 20,
                                              color: model.praiseTemplate.color,
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              );
                            },
                            itemCount: 4,
                          ),
                        ),
                        kVerticalMediumSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'previewPraise',
                              arguments: ScreenArguments(
                                arg: Preview(
                                  praise: Praise(
                                    sender: 'Sanchit',
                                    receiver: _name.text,
                                    title: _title.text,
                                    message: _message.text,
                                  ),
                                  color: model.praiseTemplate.color,
                                  image: model.praiseTemplate.image,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: model.praiseTemplate.color,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Preview',
                              style: TextStyle(
                                color: model.praiseTemplate.color,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        kVerticalMediumSpace,
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
