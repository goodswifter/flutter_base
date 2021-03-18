import 'package:flutter/material.dart';
import '../model/user_info.dart';

class UserInfoViewModel extends ChangeNotifier {
  UserInfo _userInfo;

  UserInfoViewModel(this._userInfo);

  UserInfo get userInfo => this._userInfo;

  set userInfo(UserInfo value) {
    this._userInfo = value;
    notifyListeners();
  }
}
