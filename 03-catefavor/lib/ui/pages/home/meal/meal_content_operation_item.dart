import 'package:flutter/material.dart';
import 'package:catefavor/core/extension/int_extension.dart';

class ADOperationItem extends StatelessWidget {
  final Icon _icon;
  final String _title;
  final Color textColor;

  ADOperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.px,
      padding: EdgeInsets.symmetric(vertical: 16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          SizedBox(width: 3.px),
          Text(_title, style: TextStyle(color: textColor),)
        ],
      ),
    );
  }
}
