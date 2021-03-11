import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../model/user_info.dart';
import 'counter_view_model.dart';
import 'user_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (ctx) => ADCounterViewModel(),
  ),
  ChangeNotifierProvider(
    create: (ctx) => ADUserViewModel(UserInfo('zad', 18, 'url')),
  ),
];
