main(List<String> args) {
	// 1.明确的声明
  String name = "zad";

	// 2.类型推导(var/final/const)
	// 类型推导的方式虽然没有明确的指定变量的类型, 但是变量是有自己的明确的类型
	// 2.1.var声明变量
  var age = 20;
  // 默认age是int变量, 所以不能赋值其他变量
  // age  = "abc";
  print(age);

  // 2.2 final声明常量
  final height = 1.88;
  // 常量不能被修改
  // height = 2;

  // 2.3 const声明常量
  const address = "广州市";
  
  // 2.4 final和const的区别
  // const 必须赋值, 编译期间需要有一个确定的值
  // final 可以通过计算或者函数获取一个值, 运行期间就可以来确定一个值
  // 写法错误
  // const data1 = DateTime.now();
  final date2 = DateTime.now();

  // 2.5 final 用途更多一点
  // 判断两个对象是不是同一个对象
  final p1 = Person("abc");
  final p2 = Person("abc");
  print(identical(p1, p2)); // false

  const p3 = const Person("why");
	const p4 = const Person("why");
  print(identical(p3, p4)); // true

  // 如果前面用const修饰, 后面的const可以省略
  const p5 = Person("why");
	const p6 = Person("why");
  print(identical(p5, p6)); // true

  // 如果
  final p7 = const Person("why");
	final p8 = const Person("why");
  print(identical(p7, p8)); // true
}

// Person 类
class Person {
  final String name;

  const Person(this.name);
}