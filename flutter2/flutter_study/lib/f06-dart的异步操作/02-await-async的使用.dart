import 'dart:io';

main(List<String> args) {
  print("main start");

  getData().then((value) {
    print(value);
  }).catchError((err) {
    print(err);
  });

  print("main end");
}

Future getData() async {
  var res1 = await getNetworkData("argument1");
  print(res1);
  var res2 = await getNetworkData(res1);
  print(res2);
  var res3 = await getNetworkData(res2);

  return res3;
}

Future<String> getNetworkData(String arg) async {
  sleep(Duration(seconds: 1));

  return "Hello World" + arg;
  // return Future(() {
  //   sleep(Duration(seconds: 1));
  //   return "Hello World" + arg;
  // });
}

/// 1. await 必须在async函数中才是使用
/// 2. async函数返回的结果必须是一个Future
Future getNetworkData1() async {
  var sum1 = 0;
  for (var i = 0; i < 100; i++) {
    sum1 += i;
  }
  print(sum1);
  return "Hello World";
}
