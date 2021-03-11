main(List<String> args) {
  var p1 = Person("zad");
  print(p1);
}

class Person {
  final String name;
  final int age;

  // 方式一和方式二的区别:
  // 方式一: 应用更广泛
  // 方式二: 有局限性, 不能使用表达式, 如三目运算符
  
  // 方式一
  // Person(this.name, {int age}): this.age = age ?? 10 { }

  // 方式二
  Person(this.name, {this.age = 10});

  @override
  String toString() {
    return "$name, $age";
  }
}