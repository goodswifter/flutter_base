main(List<String> args) {
  sayHello3("hh", age: 14, height: 3);
}

// 必选参数: 必须传
void sayHello1(String name) {
  print(name);
}

// dart 中没有函数的重载
// 可选参数: 1. 位置可选参数 2. 命名可选参数
// 注意: 只有可选参数才可以有默认值

// 1. 位置可选参数: [int age, double height]
// 实参和形参在进行匹配时, 是根据位置进行匹配
void sayHello2(String name, [int age = 10, double height]) {
  print("$name, $age, $height");
}

// 2. 命名可选参数
void sayHello3(String name, {int age = 10, double height}) {
  print("$name, $age, $height");
}
