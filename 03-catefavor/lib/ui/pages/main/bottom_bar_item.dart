import 'package:flutter/material.dart';
import '../../../core/extension/int_extension.dart';

class ADBottomBarItem extends BottomNavigationBarItem {
  ADBottomBarItem(String title, String iconName): super(
    title: Text(title),
    icon: Image.asset("assets/images/tabbar/$iconName.png", width: 32.px,),
    // gaplessPlayback的作用, 点击的时候icon -> activeIcon, 中间不会有一张白色图片的过度
    activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 32.px, gaplessPlayback: true,),
  );
}