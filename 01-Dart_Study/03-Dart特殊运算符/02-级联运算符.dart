main(List<String> args) {
  // var p = Person();
  // p.name = "why";
  // p.run();
  // p.eat();

  // 级联运算符
  var p = Person()
    ..name = "zad"
    ..eat()
    ..run();

  print(p);
}

class Person {
  String name;

  void run() {
    print("running");
  }

  void eat() {
    print("eating");
  }
}
