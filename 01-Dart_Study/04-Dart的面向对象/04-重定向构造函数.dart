main(List<String> args) {
  var p = Person.fromName('hh');
  print('${p.name} , ${p.age}');
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
  Person.fromName(String name): this(name, 0);
}