import 'package:flutter/material.dart';

// 4. Expanded的使用
class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /**
         * Flexible中的属性:
         * - flex
         * Expanded(更多) -> Flexible(fit: FlexFit.tight)
         * 空间分配问题, 根据flex来分配空间, 如果被Expanded包括, 主轴上对应的width/height就会不生效
         */
        Expanded(flex: 1, child: Container(height: 60, color: Colors.red)),
        Expanded(
            child: Container(width: 1000, height: 100, color: Colors.green)),
        Container(width: 90, height: 80, color: Colors.blue),
        Container(width: 50, height: 120, color: Colors.orange),
      ],
    );
  }
}

/// 3. Flexible的使用
class FlexibleDemo extends StatelessWidget {
  const FlexibleDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /**
           * Flexible中的属性:
           * - flex
           * - fit:
           *   tight 紧凑的
           *   loose 宽松的
           * 空间分配问题, 根据flex来分配空间, 如果被Expanded包括, 主轴上对应的width/height就会不生效
           */
          Flexible(
              fit: FlexFit.tight,
              child: Container(width: 90, height: 60, color: Colors.red)),
          Flexible(
              child: Container(width: 100, height: 100, color: Colors.green)),
          Container(width: 90, height: 80, color: Colors.blue),
          Container(width: 50, height: 120, color: Colors.orange),
        ],
      ),
    );
  }
}