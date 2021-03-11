main(List<String> args) {
  // 1. 直接找到另一个定义的函数传进去
  // test(bar);

  // 2. 匿名函数 (函数列表) {};
  // test(() {
  //   print("匿名函数被调用");
  //   return 20;
  // });

  // 3. 箭头函数: 条件, 函数体只有一行代码
  // test(() => print("箭头函数被调用"));
  test(() => bar(10, 20));
}

void test(Function foo) {
  // 1. 函数
  // var result = foo(10, 20);
  // print(result);

  // 2. 匿名函数
  // var result = foo();
  // print(result);

  // 3. 箭头函数
  foo();
}

int bar(int num1, int num2) {
  print("bar函数被调用");
  return num1 + num2;
}