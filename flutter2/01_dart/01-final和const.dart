/// 1. final
/// 用来修饰变量只能被赋值一次，可以在运行时赋值
/// 在类中使用final声明变量时, 必须进行初始化

class testFinal {
  /// 正确用法
  final String title = "页面";

  /// 错误用法
  // The final variable 'title' must be initialized.
  // Try initializing the variable.
  // final String title;

  void test() {
    // 'title' can't be used as a setter because it's final.
    // Try finding a different setter, or making 'title' non-final.
    // title = "页面";
  }
}

class TestPage {
  // 初始化类之前就会初始化title变量
  final String title;

  TestPage(this.title);
}

/// 2. const
/// const 可用来修饰变量、修饰常量构造函数，修饰的变量只可被赋值一次。

/// 2.1 修饰变量
/// const 修饰的变量会在编译器以至于应用整个生命周期内都是不可变的常量，在内存中也只会创建一次，之后的每次调用都会复用第一次创建的对象。
/// 全局常量 声明
const String name = "张三";

class TestPage2 {
  /// 类常量 规范要求必须使用 static 修饰
  static const String name = "张三";
  void test() {
    ///方法块常量
    const String name = "张三";
  }
}

/// 2.2 修饰常量构造函数
class testPage {
  final String title;

  const testPage(this.title);
}

/// 3. final和const的区别
/// 3.1 修饰的变量取值时机不同
/// const: 在编译时已经确定的值, 也就是在运行时之前确定的值
/// final: 可在运行时确定的值
class testPage2 {
  final age = 18;

  /// DateTime.now() 需要在运行时才能获取值
  final date1 = DateTime.now();
  static const name = "Dav";
  // static const date2 = DateTime.now(); // ❌ error:Const variables must be initialized with a constant value
}

/// 3.2 应用范畴不同
/// final: 只可用来修饰变量
/// const: 即可修饰变量也可用来修饰常量构造函数

/// Person 类
class Person {
  final String name;
  const Person(this.name);
}

main(List<String> args) {
  // 判断两个对象是不是同一个对象
  // new 可以省略
  final p1 = new Person("abc");
  final p2 = Person("abc");
  print(identical(p1, p2)); // false

  const p3 = const Person("why");
  const p4 = const Person("why");
  print(identical(p3, p4)); // true

  // 如果前面用const修饰, 后面的const可以省略
  const p5 = Person("why");
  const p6 = Person("why");
  print(identical(p5, p6)); // true

  // 如果前面用final修饰, 后面的const不能省略
  final p7 = const Person("why");
  final p8 = const Person("why");
  print(identical(p7, p8)); // true
}
