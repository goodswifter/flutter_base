import 'dart:io';

main(List<String> args) {
  print("main start");

  Future(() {
    // 1. 发送第一次请求
    sleep(Duration(seconds: 1));
    return "第一次结果";
  }).then((res) {
    print(res);
    // 2. 发送第二次请求
    sleep(Duration(seconds: 1));
    return "第二次结果";
  }).then((res) {
    print(res);
    // 3. 发送第三次请求
    sleep(Duration(seconds: 1));
    return "第三次结果";
  }).then((res) {
    print(res);
  }).catchError((err) {
    print(err);
  });

  print("main end");
}