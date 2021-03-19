import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class ADMealOperationItem extends StatelessWidget {
  final Icon _icon;
  final String _title;
  final Color textColor;

  ADMealOperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 不设置颜色不能点击, 可能是一个bug
      color: Colors.transparent,
      width: 110.px,
      // height: 50.px,
      padding: EdgeInsets.symmetric(vertical: 16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 3.px),
          Text(
            _title,
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
