import 'package:employee_directory/core/services/userService.dart';
import 'package:employee_directory/ui/shared/colors.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:flutter_aad_oauth/model/config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../locator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static const String TENANT_ID = "4a6c96ed-7fe7-42e9-98b1-a14488f469a0";
  static const String CLIENT_ID = "c62b3bb9-26f8-45e9-b173-d0100fab8e3d";

  late Config config;
  late FlutterAadOauth oauth = FlutterAadOauth(config);

  var user = locator<UserService>();

  @override
  initState() {
    var redirectUri;
    late String scope;
    late String responseType;

    scope = "openid profile offline_access Mail.Send";
    responseType = "code";
    redirectUri = "https://login.live.com/oauth20_desktop.srf";

    config = new Config(
        azureTennantId: TENANT_ID,
        clientId: CLIENT_ID,
        scope: scope,
        redirectUri: "$redirectUri",
        responseType: responseType);

    oauth = FlutterAadOauth(config);
    oauth.setContext(context);
    checkIsLogged();
    super.initState();
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = new AlertDialog(content: new Text(text), actions: <Widget>[
      new ElevatedButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void checkIsLogged() async {
    EasyLoading.show(
      status: 'Logging In...',
      maskType: EasyLoadingMaskType.custom,
    );
    if (await oauth.tokenIsValid()) {
      String? accessToken = await oauth.getAccessToken();
      await user.sendMail(accessToken!);
      Navigator.pushReplacementNamed(context, '/');
    }
    EasyLoading.dismiss();
  }

  void login() async {
    try {
      await oauth.login();
      String? accessToken = await oauth.getAccessToken();
      await user.getLoggedInUser(accessToken!);
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showError(e);
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage("Logged out");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                width: size.width,
                height: 60,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: kColors[0],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.microsoft,
                      color: kColors[0],
                    ),
                    kHorizontalSmallSpace,
                    kHorizontalSmallSpace,
                    Text(
                      'Using Office 365',
                      style: TextStyle(
                        color: kColors[0],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logout();
        },
        child: Icon(
          FontAwesomeIcons.signOutAlt,
        ),
      ),
    );
  }
}
