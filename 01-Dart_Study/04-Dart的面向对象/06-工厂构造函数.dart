main(List<String> args) {
  final p1 = Person.withName('zad');
  final p2 = Person.withName('zad');
  print(identical(p1, p2));
}

// 普通的构造函数: 会自动返回创建出来的对象, 不能手动的返回
// 工厂构造函数最大的特点: 可以手动的返回一个对象
class Person {
  String name;
  int age;

  Person(this.name, this.age);
  
  static final Map<String, Person> _nameCache = {};
  static final Map<int, Person> _ageCache = {};

  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final p = Person(name, 18);
      _nameCache[name] = p;
      return p;
    }
  }

  factory Person.withAge(int age) {
    if (_nameCache.containsKey(age)) {
      return _ageCache[age];
    } else {
      final p = Person('zad', age);
      _ageCache[age] = p;
      return p;
    }
  }
}