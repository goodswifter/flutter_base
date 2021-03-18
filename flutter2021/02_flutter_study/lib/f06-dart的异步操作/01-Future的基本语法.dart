import 'dart:io';

main(List<String> args) {
  print("main start");

  // 2. 其他API
  Future.value("哈哈哈").then((value) {
    print(value);
  });

  Future.error("❌").catchError((err) {
    print(err);
  });

  Future.delayed(Duration(seconds: 1), () => "Hello world").then((value) {
    print(value);
    return "2222";
  }).then((value) {
    print(value);
  });

  print("main end");
}

// 1. 基本使用
futureDemo01() {
  print("main start");

  // 发送一个网络请求
  // getNetworkData().then((value) => print(value));
  Future(() {
    sleep(Duration(seconds: 1));

    // return "Hello World";

    throw Exception("错误信息");
  }).then((value) {
    print(value);
  }).catchError((err) {
    print(err);
  }).whenComplete(() {
    print("代码执行完毕");
  });

  print("main end");
}

Future getNetworkData() {
  return Future(() {
    sleep(Duration(seconds: 1));
    return "Hello World";
  });
}
