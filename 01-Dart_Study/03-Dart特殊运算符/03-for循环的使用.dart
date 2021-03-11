main(List<String> args) {
  // 1. 基础for循环
  for (var i = 0; i < 10; i++) {
    print(i);
  }

  // 2. 遍历
  var names = ["zad", "cba", "nba"];
  for (var name in names) {
    print(name);
  }
}