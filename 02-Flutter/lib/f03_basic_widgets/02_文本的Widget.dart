

import 'package:flutter/material.dart';

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
//          text: "hello world",
//          style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
              TextSpan(text: "Hello Flutter", style: TextStyle(color: Colors.green)),
              WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
              TextSpan(text: "Hello Dart", style: TextStyle(color: Colors.blue)),
            ]
        )
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼\n 莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.start,
//          maxLines: 2,
      // 超出布局样式, ellipsis: 省略号
//          overflow: TextOverflow.ellipsis,
      // 缩放因子
      textScaleFactor: 1.5,
      style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }
}