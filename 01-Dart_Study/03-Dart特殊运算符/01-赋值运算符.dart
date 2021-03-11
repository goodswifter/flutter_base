main(List<String> args) {
  // 1. ??=
  // 当原来的变量有值时, 那么 ??= 就不执行
  // 原来的变量为null时, 那么将值赋给这个变量
  // var name = null;
  // name ??= "lilei";
  // print(name);

  // 2. ??
  // ??前面的数据有值, 那么就是用 ?? 前面的值
  // ??前面的数据为null, 那么就是用 ?? 后面的值
  var name = "abc";
  var temp = name ?? "lilei";
  print(temp);
}