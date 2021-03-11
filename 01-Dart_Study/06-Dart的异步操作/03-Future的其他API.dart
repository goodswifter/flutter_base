main(List<String> args) {
  print("main start");

  Future.value("哈哈哈").then((res) {
    print(res);
  });

  Future.error("错误信息").catchError((err) {
    print(err);
  });

  Future<String>.delayed(Duration(seconds: 1), () {
    return "Hello Flutter";
  }).then((res) {
    print(res);
    return "22222";
  }).then((res) {
    print(res);
  });

  print("main end");
}