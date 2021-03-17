import 'package:flutter/material.dart';

class ADBottomBarItem extends BottomNavigationBarItem {
  ADBottomBarItem(String title, String iconName)
      : super(
          label: title,
          icon: Image.asset(
            "assets/images/tabbar/$iconName.png",
            width: 32,
          ),
          backgroundColor: Colors.orange,
          activeIcon: Image.asset(
            "assets/images/tabbar/${iconName}_active.png", width: 32,
            // gaplessPlayback的作用, 点击的时候icon -> activeIcon, 中间不会有一张白色图片的过度
            gaplessPlayback: true,
          ),
        );
}
