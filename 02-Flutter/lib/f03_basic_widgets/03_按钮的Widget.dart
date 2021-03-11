import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 1. 凸起按钮
        RaisedButton(
          child: Text("RaisedButton"),
          textColor: Colors.white,
          color: Colors.purple,
          onPressed: () => print("RaisedButton - Click"),
        ),

        // 2. 平坦按钮
        FlatButton(
          child: Text("FlatButton"),
          color: Colors.orange,
          onPressed: () => print("FlatButton Click"),
        ),

        // 3. 有轮廓的按钮
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () => print("OutlineButton"),
        ),

        // 4. 悬浮按钮: FloatingActionButton

        // 5. 自定义button: 图标-文字-背景-圆角
        FlatButton(
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.red,),
              Text("喜欢作者")
            ],
          ),
          onPressed: () {},
        )

      ],
    );
  }
}