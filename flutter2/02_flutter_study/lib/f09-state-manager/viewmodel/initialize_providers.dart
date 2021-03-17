import 'package:flutter_study/f09-state-manager/model/user_info.dart';
import 'package:flutter_study/f09-state-manager/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'counter_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => CounterViewModel()),
  ChangeNotifierProvider(
      create: (ctx) => UserInfoViewModel(UserInfo("zad", 2, "imageURL"))),
];
