import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Sliver Demo"),
//        ),
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
    return CustomScrollView02();
  }
}

class CustomScrollView02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 300,
        // 用针别住
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text("Hello World"),
          background: Image.asset(
            "assets/images/haha.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverGrid(
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
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人$index"),
          );
        }, childCount: 20),
      )
    ]);
  }
}

class CustomScrollView01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // 安全领域
        SliverSafeArea(
          // Sliver自带的Padding, 上面的Padding不会一直有间隙
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
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
