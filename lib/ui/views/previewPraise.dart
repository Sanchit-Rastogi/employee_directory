import 'package:employee_directory/core/models/preview.dart';
import 'package:employee_directory/core/services/apiService.dart';
import 'package:employee_directory/locator.dart';
import 'package:employee_directory/ui/shared/textStyles.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreviewPraiseView extends StatefulWidget {
  final Preview praisePreview;

  PreviewPraiseView({required this.praisePreview});

  @override
  _PreviewPraiseViewState createState() => _PreviewPraiseViewState();
}

class _PreviewPraiseViewState extends State<PreviewPraiseView> {
  final api = locator<APIService>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: widget.praisePreview.color.withAlpha(30),
                    image: DecorationImage(
                      image: AssetImage('assets/${widget.praisePreview.image}'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.praisePreview.praise.title,
                        style: kSmallBoldTextStyle,
                      ),
                      kVerticalSmallSpace,
                      Text(
                        widget.praisePreview.praise.receiver,
                        style: TextStyle(
                          color: widget.praisePreview.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      kVerticalMediumSpace,
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    widget.praisePreview.praise.message,
                    style: kSmallTextStyle,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                api.sendPraise(widget.praisePreview.praise);
                Fluttertoast.showToast(msg: '🥳 Your Praise was sent');
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Container(
                width: size.width,
                height: 60,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: widget.praisePreview.color,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: widget.praisePreview.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
