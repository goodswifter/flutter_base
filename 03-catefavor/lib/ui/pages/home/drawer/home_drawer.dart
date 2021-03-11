import 'package:catefavor/ui/pages/home/drawer/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:catefavor/core/extension/int_extension.dart';

class ADHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildHeaderView(context),
          buildListTile(context, Icon(Icons.restaurant), "进餐", () {
            Navigator.of(context).pop();
          }),
          buildListTile(context, Icon(Icons.settings), "过滤", () {
            Navigator.of(context).pushNamed(ADFilterPage.routeName);
          }),
        ],
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, .5),
      child: Text("开始动手", style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline3,),
      onTap: handler,
    );
  }
}
