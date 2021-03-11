main(List<String> args) {
  final sm = SuperMan();
  sm.running();
}

mixin Runner {
  void running() {
    print("Runner - run");
  }
}

mixin Flyer {
  void flying() {
    print("Flyer - fly");
  }
}

class Animal {
  void eating() {
    print("动物次东西");
  }

  void running() {
    print("animal running");
  }
}
/**
 * 注意: 混入会覆盖继承的方法, 但不能覆盖自己的方法
 * 混入类的方法可以不需要实现
 */
class SuperMan extends Animal with Runner, Flyer {
  @override
  void eating() {
    super.eating();
  }

  // void running() {
  //   print("SuperMan - running");
  // }
}