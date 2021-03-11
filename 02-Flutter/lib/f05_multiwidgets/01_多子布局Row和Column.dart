import 'package:flutter/material.dart';

/// 2. Column的基本使用
class ColumnDemo01 extends StatelessWidget {
  const ColumnDemo01({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      /**
       * verticalDirection: 排列顺序
       * up: 从下往上排列
       * down: 从上往下排列
       */
      verticalDirection: VerticalDirection.up,
//      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
          child: Text(
            "Hellxo",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 120,
          height: 100,
          color: Colors.green,
          child: Text(
            "Woxrld",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          width: 90,
          height: 80,
          color: Colors.blue,
          child: Text(
            "abxc",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 50,
          height: 120,
          color: Colors.orange,
          child: Text(
            "cxba",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}

/// 1. Row的基本使用
class RowDemo01 extends StatelessWidget {
  const RowDemo01({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Row特点:
     *  - 水平方向尽可能占据比较大的空间
     *    * mainAxisSize
     *    * 水平方向也是希望包裹内容, 那么设置mainAxisSize = min
     *  - 垂直方向包裹内容
     * MainAxisAlignment:
     *  - start: 主轴的开始位置挨个摆放元素(默认值)
     *  - end: 主轴的结束位置挨个摆放元素
     *  - center: 主轴的中心点对齐
     *  - spaceBetween: 左右两边的间距为0, 其它元素之间平分间距
     *  - spaceAround: 左右两边的间距是其它元素之间的间距的一半
     *  - spaceEvenly: 所有的间距平分空间
     * CrossAxisAlignment:
     *  - start: 交叉轴的起始位置对齐
     *  - end: 交叉轴的结束位置对齐
     *  - center: 中心点对齐(默认值)
     *  - baseline: 基线对齐(必须有文本的时候才起效果), 必须设置textBaseline才能使用这个枚举
     *  - stretch: 先Row占据交叉轴尽可能大的空间, 将所有的子Widget交叉轴的高度, 拉伸到最大
     */
    return Container(
      height: 300,
      color: Colors.black38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        /**
         * alphabetic: 按照字母的基线对齐
         * ideographic: 按照汉字的基线对齐
         */
//        textBaseline: TextBaseline.ideographic,
//        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Text(
              "我是中国人",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Text(
              "Why",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            color: Colors.green,
            child: Text(
              "Hello Dart",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            color: Colors.orange,
            child: Text(
              "1990",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}