/**
 * 1.main函数是dart入口
 * 2.dart当中打印信息使用print函数
 */

main(List<String> args) {
  // List<String> args -> 列表<String> - 泛型
  // print("Hello World");
  dynamic name = 'why';
  print(name.runtimeType);
  name = 18;
  print(name.runtimeType);
  // 这种情况就会报错
  print(name.substring(1));

  Object obj = 'cba';
  print(obj.runtimeType);
  // obj = 18;
  // print(obj.substring(1));
}
