
// 这个代码是有问题的
import 'package:flutter/material.dart';

class ADHomeBody extends StatelessWidget {
  // 错误的代码
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          // 主轴对齐方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: flag,
              onChanged: (value) => flag = value,
            ),
            Text("同意协议", style: TextStyle(fontSize: 20),)
          ],
        )
    );
  }
}