main(List<String> args) {
  var p = Person("zad", 18);
  print(p.name);
}

class Person {
  String name;
  int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  Person(this.name, this.age);
}