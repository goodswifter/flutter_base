import 'package:flutter/material.dart';

class ADHomeAppBar extends AppBar {
  ADHomeAppBar(BuildContext context)
      : super(
          title: Text("美味佳肴"),
          leading: Builder(
            builder: (ctx) => IconButton(
              splashRadius: 0.01,
              icon: Icon(Icons.build),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        );
}
