import 'package:flutter/material.dart';
import 'package:flutter_study/f08-douban/pages/home/home.dart';
import 'bottom_bar_item.dart';
import 'package:flutter_study/f08-douban/pages/subject/subject.dart';

// 页面
List<Widget> pages = [
  ADHomePage(),
  ADSubjectPage(),
  ADSubjectPage(),
  ADSubjectPage(),
  ADSubjectPage(),
];

// TabBarItems
List<BottomNavigationBarItem> items = [
  ADBottomBarItem("首页", "home"),
  ADBottomBarItem("书影音", "subject"),
  ADBottomBarItem("小组", "group"),
  ADBottomBarItem("市集", "mall"),
  ADBottomBarItem("我的", "profile"),
];
