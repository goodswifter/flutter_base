import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/counter_view_model.dart';

/// provider的使用过程
/// 1. 创建自己需要共享的数据, 并继承ChangeNotifier

/// 2. 在应用程序的顶层包装ChangeNotifierProvider类

/// 3. 使用共享数据有三种方式
/// 3.1 方式一: Provider.of
/// 特点: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
/// 改变数据的时候, 使用Consumer修改
/// 3.2 方式二: Consumer(相对推荐)
/// 特点: 当Provider中的数据发生改变时, 重新执行Consumer的builder
/// 3.3 方式三: Selector
/// 3.3.1 selector方法(作用, 对原有的数据进行转换)
/// 3.3.2 shouldRebuild(作用, 当前Selector的builder方法是否需要重新创建)
/// Selector比Consumer更高级的一点, Selector连自己的builder都不需要重新创建

/// 注意: builder: (ctx, counterVM, child)中第三个参数child, 是用来优化性能, 外面设置child, 内部的child就不需要重新创建了

main() {
  // 2. 在应用程序的顶层包装ChangeNotifierProvider类
  runApp(ChangeNotifierProvider(
    create: (ctx) => ADCounterViewModel(),
    child: MyApp(),
  ));
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
      // 使用Consumer
      floatingActionButton: Consumer<ADCounterViewModel>(
        builder: (ctx, counterVM, child) {
          print("Consumer builder方法被执行");
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              counterVM.counter += 1;
            },
          );
        },
      ),
      // 使用Selector
//      floatingActionButton: Selector<ADCounterViewModel, ADCounterViewModel>(
//        selector: (ctx, counterVM) => counterVM, // 注意: 返回参数中的counterVM
//        shouldRebuild: (previous, next) => false, // 当前Selector的builder方法是否重新创建
//        child: Icon(Icons.add), // 这里添加child
//        builder: (ctx, counterVM, child) {
//          print("Selector builder方法被执行");
//          return FloatingActionButton(
//            child: child, // 设置child
//            onPressed: () {
//              counterVM.counter += 1;
//            },
//          );
//        },
//      ),
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

class ADShowData01 extends StatefulWidget {
  @override
  _ADShowData01State createState() => _ADShowData01State();
}

class _ADShowData01State extends State<ADShowData01> {
  @override
  Widget build(BuildContext context) {
    // 3.1 使用共享数据: Provider.of
    int counter = Provider.of<ADCounterViewModel>(context).counter;

    print("data01的build方法");

    return Card(
      color: Colors.red,
      child: Text(
        "当前计数: $counter",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class ADShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data02的build方法");

    return Container(
      color: Colors.blue,
      // 3.2 使用共享数据: Consumer
      child: Consumer<ADCounterViewModel>(
        builder: (ctx, counterVM, child) {
          print("data02 Consumer builder方法被执行");
          return Text(
            "当前计数: ${counterVM.counter}",
            style: TextStyle(fontSize: 30),
          );
        },
      ),
    );
  }
}
