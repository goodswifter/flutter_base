import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text("CustomScrollView")),
        body: ADHomeBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView02();
  }
}

class CustomScrollView02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          floating: true,
          // title: Text("可折叠组件"),
          // 用针别住
          // pinned: true,
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          // title: Text("哈哈哈哈"),
          flexibleSpace: FlexibleSpaceBar(
            // title: Text("Hello World"),
            background: Container(
              child: Text("哈哈哈"),
              color: Colors.red,
            ),
          ),
          // flexibleSpace: Text("哈哈哈"),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int int) {
                return Container(
                  color: Color.fromARGB(
                    255,
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
        SliverSafeArea(
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人$index"),
                );
              },
              childCount: 20,
            ),
          ),
        )
      ],
    );
  }
}

class CustomScrollView01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 安全领域
        SliverSafeArea(
          // Sliver自带的Padding, 上面的Padding不会一直有间隙
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext ctx, int index) {
                  return Container(
                    color: Color.fromARGB(
                      255,
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256),
                    ),
                  );
                },
                childCount: 50,
              ),
            ),
          ),
        )
      ],
    );
  }
}
