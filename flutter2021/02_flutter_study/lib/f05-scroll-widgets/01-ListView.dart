import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: ADHomeBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListViewDemo03();
  }
}

/// 3. ListView.separated
/// 比ListView.builder多一个separatorBuilder属性
/// 但是, separated 不能设置item行高, 只能自适应高度
class ListViewDemo03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(
          "Hello World: $index",
          style: TextStyle(fontSize: 20),
        );
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return Divider(
          color: Colors.red,
          height: 30, // 行高
          indent: 30, // 分割线的高度
          endIndent: 30,
          thickness: 10,
        );
      },
    );
  }
}

/// 2. 通过ListView.builder创建
/// 优点: 懒加载item, 显示的时候再加载, 提高效率
class ListViewDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      // Item的高度
      itemExtent: 60,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          "Hello World: $index",
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

/// 1. 通过构造器创建
/// List.generate
/// 缺点是把所有的数据全部加载出来, 比较耗性能
class ListViewDemo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // 滚动方向
//      scrollDirection: Axis.horizontal,
      // 反向排列 1, 2, 3 -> 3, 2, 1
//    reverse: true,
      // Item的高度
      itemExtent: 100,
      children: List.generate(100, (int index) {
        // ListTile: 列表的瓦片
        return ListTile(
          leading: Icon(Icons.person),
          trailing: Icon(Icons.delete),
          title: Text("联系人: ${index + 1}"),
          subtitle: Text("电话号码: 188888888888"),
        );
      }),
    );
  }
}
