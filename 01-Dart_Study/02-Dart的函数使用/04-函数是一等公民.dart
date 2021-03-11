main(List<String> args) {
  // test((abc) {
  //   print(abc);
  // });

  var add1 = add();
  print(add1(20, 30));

  test(add());
}

// 封装test函数, 要求: 传入一个函数
// void test(Function foo) {
//   foo("why");
// }

// 封装计算类型
typedef Calculate = int Function(int num1, int num2);

void test(Calculate cal) {
  print(cal(40, 30));
}

Calculate add() {
  return (num1, num2) {
    return num1 + num2;
  };
}
