import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("按钮Widget"),
        ),
        body: ADHomeBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("floatingActionButton - Click"),
          child: Icon(Icons.add),
        ),
        // FloatingActionButton位置设置
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          // 1. 凸起按钮
          // Text.style > RaisedButton.textColor
          RaisedButton(
            child: Text(
              "RaisedButton",
              // style: TextStyle(color: Colors.red),
            ),
            textColor: Colors.white,
            color: Colors.purple,
            onPressed: () => print("RaisedButton - Click"),
          ),

          // 2. 平坦按钮
          FlatButton(
            child: Text("FlatButton"),
            color: Colors.orange,
            onPressed: () => print("FlatButton - Click"),
          ),

          // 3. 有轮廓的按钮
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () => print("OutlineButton - Click"),
          ),

          // 4. 悬浮按钮: FloatingActionButton

          // 5. 自定义Button: 图标-文字-背景-圆角
          FlatButton(
            onPressed: () => print("自定义Button - Click"),
            color: Colors.greenAccent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text("喜欢作者"),
              ],
            ),
          ),

          // 6. 自定义Button Extension
          // 6.1 默认情况下Button上下有一定的间距
          // 6.2 Button变小: ButtonTheme
          // 6.3 去除Button的内边距
          ButtonTheme(
            // 6.2
            minWidth: 10,
            height: 10,
            child: FlatButton(
              // 6.3
              padding: EdgeInsets.all(0),
              onPressed: () => print("Button Extension - Click"),
              color: Colors.red,
              // 6.1
              // 设置为MaterialTapTargetSize.shrinkWrap时，button距顶部距离为0；
              // 设置为MaterialTapTargetSize.padded时距顶部和下部有一个距离
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Icon(
                Icons.pets,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
