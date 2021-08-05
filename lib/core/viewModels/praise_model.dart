import 'package:employee_directory/core/models/praise.dart';
import 'package:employee_directory/core/services/apiService.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';

class PraiseModel extends ChangeNotifier {
  List<Praise> praiseList = [];

  void onInit() async {
    var api = locator<APIService>();
    //praiseList = await api.getPraise();
    print(praiseList.length);
    notifyListeners();
  }
}
