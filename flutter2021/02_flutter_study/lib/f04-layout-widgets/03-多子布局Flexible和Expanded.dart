import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("多子布局Flexible和Expanded"),
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
    return Column(
      children: [
        FlexibleWidget(),
        ExpandedWidget(),
      ],
    );
  }
}

/// Flexible中的属性:
/// - flex
/// Expanded 相当于 Flexible(fit: FlexFit.tight)
/// 空间分配问题, 根据flex来分配空间, 如果被Expanded包括, 主轴上对应的width/height就会不生效
class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /**
         * Flexible中的属性:
         * - flex
         * Expanded(更多) -> Flexible(fit: FlexFit.tight)
         * 空间分配问题, 根据flex来分配空间, 如果被Expanded包括, 主轴上对应的width/height就会不生效
         */
        Expanded(
          flex: 1,
          child: Container(height: 60, color: Colors.red),
        ),
        Expanded(
          flex: 1,
          child: Container(width: 1000, height: 100, color: Colors.green),
        ),
        Container(width: 90, height: 80, color: Colors.blue),
        Container(width: 50, height: 120, color: Colors.orange),
      ],
    );
  }
}

/// Flexible中的属性:
/// - flex
///   只有fit=tight时, flex才起作用
/// - fit:
///   tight 紧凑的
///   loose 宽松的
/// 空间分配问题, 根据flex或者fit来分配空间, 如果被Expanded/Flexible包括, 主轴上对应的width/height就会不生效
class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            // fit: FlexFit.tight,
            child: Container(height: 60, color: Colors.red),
          ),
          Flexible(
            flex: 1,
            // 如果不设置fit, 默认会给他留一个空间
            // fit: FlexFit.tight,
            child: Container(width: 100, height: 100, color: Colors.green),
          ),
          Container(width: 90, height: 80, color: Colors.blue),
          Container(width: 50, height: 120, color: Colors.orange),
        ],
      ),
    );
  }
}
