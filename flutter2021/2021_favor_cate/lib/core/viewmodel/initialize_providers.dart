import 'package:favor_cate/core/viewmodel/favor_view_model.dart';
import 'package:favor_cate/core/viewmodel/filter_view_model.dart';
import 'package:favor_cate/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  // ChangeNotifierProvider(
  //   create: (ctx) => ADMealViewModel(),
  // ),
  // ChangeNotifierProvider(
  //   create: (ctx) => ADFavorViewModel(),
  // ),
  ChangeNotifierProvider(
    create: (ctx) => ADFilterViewModel(),
  ),
  ChangeNotifierProxyProvider<ADFilterViewModel, ADMealViewModel>(
    create: (context) => ADMealViewModel(),
    update: (context, filterVM, mealVM) {
      mealVM.updateFilterVM(filterVM);
      return mealVM;
    },
  ),
  ChangeNotifierProxyProvider<ADFilterViewModel, ADFavorViewModel>(
    create: (context) => ADFavorViewModel(),
    update: (context, filterVM, favorVM) {
      favorVM.updateFilterVM(filterVM);
      return favorVM;
    },
  ),
];
