import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 100;
  int get counter => this._counter;

  set counter(int value) {
    this._counter = value;
    notifyListeners();
  }
}
