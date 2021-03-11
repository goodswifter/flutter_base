import 'package:flutter/cupertino.dart';
import '../model/user_info.dart';

class ADUserViewModel extends ChangeNotifier {
  UserInfo _user;

  ADUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }

}