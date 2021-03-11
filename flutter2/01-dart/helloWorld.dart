class Person {
  String name;
  int age;

  Person();

  eat() {}

  run() {}

  @override
  String toString() {
    return super.toString();
  }
}

main(List<String> args) {
  Person p = Person();
  p.name = "哈哈";
  print(p.name);

  var p1 = Person()
    ..name = "zad"
    ..eat()
    ..run();
  num a = 10.20;

  print(a.runtimeType);
}

class Animal {
  int age;

  Animal(this.age);
}

class Dog extends Animal {
  String name;

  Dog(this.name, int age) : super(age);
}

abstract class Shape {
  getArea();

  getLength() {
    print("周长");
  }
}

class Circle extends Shape {
  double r;

  @override
  getArea() {
    return r * r * 3.14;
  }
}

class Cat implements Animal {
  @override
  int age;
}
