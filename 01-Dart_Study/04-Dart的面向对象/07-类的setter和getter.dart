main(List<String> args) {
  final p = Person();
  p.name = 'zad';

  // 通过getter和setter访问
  p.setName = 'lilei';
  print(p.getName);
}

class Person {
  String name;

  // setter
  set setName(String name) => this.name = name;
  // set setName(String name) {
  //   this.name = name;
  // }

  // getter
  String get getName => name;
  // String get getName {
  //   return this.name;
  // }
}