import 'dart:io';

main(List<String> args) {
  print("main start");

  // 发送一个网络请求
  // var future = getNetworkData();
  var future = Future(() {
    sleep(Duration(seconds: 1));

    return "Hello World";
  });
  
  future.then((value) {
    print(value);
  }).catchError((err) {
    print(err);
  }).whenComplete(() {
    print("代码执行完毕");
  });

  print("main end");
}

Future<String> getNetworkData() {
  return Future<String>(() {

    sleep(Duration(seconds: 1));

    // return "Hello World";

    throw Exception("错误信息");
  });
}