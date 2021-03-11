import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("基础Widget"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print("FloatingActionButton Click"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ADHomeContent(),
      ),
    );
  }
}

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewDemo03();
  }
}

/// 3. 通过GridView.builder创建
/// 能够复用item
class GridViewDemo03 extends StatelessWidget {
  const GridViewDemo03({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // symmetric: 对称的
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 8),
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          }),
    );
  }
}

/// 2. SliverGridDelegateWithMaxCrossAxisExtent
/// 交叉轴Item最大长度, 每行的item个数 = ((屏幕宽度 - crossAxisSpacing) / maxCrossAxisExtent).ceil()
class GridViewDemo02 extends StatelessWidget {
  const GridViewDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 403,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

/// 1. SliverGridDelegateWithFixedCrossAxisCount
/// 交叉轴最大个数
class GridViewDemo01 extends StatelessWidget {
  const GridViewDemo01({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8,
          childAspectRatio: 1.5),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}
