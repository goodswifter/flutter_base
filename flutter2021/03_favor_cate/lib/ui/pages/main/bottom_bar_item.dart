import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class ADBottomNavigationBarItem extends BottomNavigationBarItem {
  // 因为BottomNavigationBarItem是一个class, 不是一个Widget, 所以不能使用statelessWidget
  ADBottomNavigationBarItem(String title, String iconName): super(
    label: title,
    icon: Image.asset("assets/images/tabbar/$iconName.png", width: 32.px,),
    // gaplessPlayback的作用, 点击的时候icon -> activeIcon, 中间不会有一张白色图片的过度
    activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 32.px, gaplessPlayback: true,),
  );
}
