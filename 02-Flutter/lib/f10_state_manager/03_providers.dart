import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/counter_view_model.dart';
import 'viewmodel/initialize_providers.dart';
import 'viewmodel/user_view_model.dart';


main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      // 使用Selector
      floatingActionButton: Selector<ADCounterViewModel, ADCounterViewModel>(
        selector: (ctx, counterVM) => counterVM, // 注意: 返回参数中的counterVM
        shouldRebuild: (previous, next) => false, // 当前Selector的builder方法是否重新创建
        child: Icon(Icons.add), // 这里添加child
        builder: (ctx, counterVM, child) {
          print("Selector builder方法被执行");
          return FloatingActionButton(
            child: child, // 设置child
            onPressed: () {
              counterVM.counter += 1;
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ADHomeContent(),
    );
  }
}

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ADShowData01(), ADShowData02()],
      ),
    );
  }
}

class ADShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data02的build方法");

    return Card(
      color: Colors.blue,
      child: Consumer<ADCounterViewModel>(
        builder: (ctx, counterVM, child) {
          return Text(
            "当前计数: ${counterVM.counter}",
            style: TextStyle(fontSize: 30),
          );
        },
      ),
    );
  }
}

class ADShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data02的build方法");

    return Card(
      color: Colors.blue,
      child: Consumer2<ADCounterViewModel, ADUserViewModel>(
        builder: (ctx, counterVM, userVM, child) {
          return Text(
            "当前计数: ${counterVM.counter}, counter: ${userVM.user.nickname}",
            style: TextStyle(fontSize: 30),
          );
        },
      ),
    );
  }
}
