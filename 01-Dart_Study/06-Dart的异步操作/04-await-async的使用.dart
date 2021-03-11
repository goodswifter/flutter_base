import 'dart:io';

main(List<String> args) {
  print("main start");

  var result = getNetworkData().then((res) {
    print(res);
  });
  print(result);

  print("main end");
}

/// 1. await 必须在async函数中才是使用
/// 2. async函数返回的结果必须是一个Future
Future getNetworkData() async {
  await sleep(Duration(seconds: 1));
  return "Hello World";
}
