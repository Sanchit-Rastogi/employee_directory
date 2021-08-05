import 'package:employee_directory/ui/shared/colors.dart';
import 'package:employee_directory/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:flutter_aad_oauth/model/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static const String TENANT_ID = "865cc515-a530-4538-8ef8-072b7b2be759";
  //  "tenant_id": "865cc515-a530-4538-8ef8-072b7b2be759"
  static const String CLIENT_ID = "3744aafb-bd93-4651-afc5-ee9b5e66ab8a";
  //  "client_id" : "3744aafb-bd93-4651-afc5-ee9b5e66ab8a",

  late Config config;
  late FlutterAadOauth oauth = FlutterAadOauth(config);

  @override
  initState() {
    var redirectUri;
    late String scope;
    late String responseType;

    scope = "openid profile offline_access";
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
    if (await oauth.tokenIsValid()) {
      String? accessToken = await oauth.getAccessToken();
      Fluttertoast.showToast(
          msg: "Logged in successfully, your access token: $accessToken");
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  void login() async {
    try {
      await oauth.login();
      String? accessToken = await oauth.getAccessToken();
      Fluttertoast.showToast(
          msg: "Logged in successfully, your access token: $accessToken");
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
                //Navigator.pushReplacementNamed(context, '/');
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
    );
  }
}
