import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  String loggenInUserEmail = '';
  String bearerToken = '';

  var baseUrl = Uri.parse('https://graph.microsoft.com/v1.0/me');

  Future<void> getLoggedInUser(String token) async {
    bearerToken = token;
    await http.get(baseUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  Future<void> sendMail(String token) async {
    var mailUrl =
        Uri.parse('https://graph.microsoft.com/v1.0/me/' + 'sendMail');
    await http.post(
      mailUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          "message": {
            "subject": "Meet for lunch?",
            "body": {
              "contentType": "Text",
              "content": "The new cafeteria is open."
            },
            "toRecipients": [
              {
                "emailAddress": {
                  "address": "admin@8958698863srgmailcom.onmicrosoft.com"
                }
              }
            ],
          },
          "saveToSentItems": "false"
        },
      ),
    );
  }
}
