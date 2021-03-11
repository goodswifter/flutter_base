import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
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

class ADHomeContent extends StatefulWidget {
  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent> {
  @override
  Widget build(BuildContext context) {
    // 1.自己写Widget
    // 2.某些Widget中会创建RenderObject
    // 3.每一个Widget都会创建一个Element对象
    // 4.1. ComponentElement: mount方法 -> firstBuild -> rebuild -> performBuild -> build -> _widget.build
    // ComponetElement: StatefulElement和StatelessElement
    // 4.1.1 StatefulElement:
    // * 构造方法中 _state = widget.createState()
    // * _state._widget = widget;
    // 4.2. RenderObjectElement: mount方法 -> _widget.createRenderObject

    // 所有的Widget都会创建一个对应的Element对象
//    StatelessElement;
//    StatefulElement;

    // 组件Widget: 不会生成RenderObject
    // Container -> StatelessWidget -> Widget
//    Container();
//    Text();
//    HYHomeContent();

    // 创建Element: RenderObjectElement
    // 渲染Widget: 生成RenderObject
    // Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(createRenderObject) -> Widget
    // Padding -> createRenderObject -> RenderPadding -> RenderBox -> RenderObject
//    Padding();
//    RenderObjectWidget
    return Text("哈哈");
  }
}
