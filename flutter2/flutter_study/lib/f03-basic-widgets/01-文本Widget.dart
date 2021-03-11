import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("文本Widget"),
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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 普通文本
          TextWidget(),
          // 富文本
          RichTextWidget(),
        ],
      ),
    );
  }
}

/// 富文本
/// TODO: 富文本中文本之间的间距怎么设置?
class RichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(TextSpan(children: [
        // 文本段
        TextSpan(
            text: "Hello World",
            style: TextStyle(
              color: Colors.red,
            )),
        TextSpan(text: "Hello World", style: TextStyle(color: Colors.green)),
        // Widget文本段
        WidgetSpan(
            child: Icon(
          Icons.favorite,
          color: Colors.red,
        )),
        TextSpan(text: "Hello World", style: TextStyle(color: Colors.blue)),
      ])),
    );
  }
}

/// 普通文本
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼\n 莫听穿林打叶声，何妨吟啸且徐行。\n 竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center, // 对齐方式
      // maxLines: 2, // 最多行数
      // 超出布局样式: ellipsis 省略号
      // overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.5, // 缩放因子
      style: TextStyle(
          fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}
