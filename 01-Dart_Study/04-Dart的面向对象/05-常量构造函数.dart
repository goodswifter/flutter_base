main(List<String> args) {

  var p1 = const Person("why");
  var p2 = const Person("why");
  print(identical(p1, p2)); // false

  const p3 = Person("why");
  const p4 = Person("why");
  print(identical(p3, p4)); // true

  var p5 = Person("why");
  var p6 = Person("why");
  print(identical(p5, p6)); // false

  final p7 = Person("why");
  final p8 = Person("why");
  print(identical(p7, p8)); // false
}

class Person {
  final String name;
  // final String age;

  const Person(this.name);
  // const Person(this.name, this.age);
}