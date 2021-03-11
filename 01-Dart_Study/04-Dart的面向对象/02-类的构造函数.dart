main(List<String> args) {
  // 1. 创建Person对象
  var p = Person.withNameAgeHeight("zad", 18, 1.88);
  print(p);

  Map<String, dynamic> map = {
    "name": "zad1",
    "age": 19,
    "height": 1.98
  };
  var p1 = Person.fromMap(map);
  print(p1);
}

class Person {
  String name;
  int age;
  double height;

  Person(this.name, this.age);
  // 类中不能有重名的构造函数
  // Person(this.name, this.age, this.height);
  
  // 命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);
  Person.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return "$name, $age, $height";
  }
}