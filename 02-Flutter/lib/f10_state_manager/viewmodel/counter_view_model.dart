import 'package:flutter/material.dart';

// 1. 创建自己需要共享的数据, 并继承ChangeNotifier
class ADCounterViewModel extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
