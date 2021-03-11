import 'dart:io';

main(List<String> args) {
  print("main start");

  getData().then((res) {

  }).catchError((err) {
    
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

Future getNetworkData(String arg) {
  return Future(() {
    sleep(Duration(seconds: 1));
    return "Hello World" + arg;
  });
}