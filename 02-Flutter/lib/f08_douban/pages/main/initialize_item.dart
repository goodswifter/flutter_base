import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';

List<Widget> pages = [
  ADHomePage(),
  ADSubjectPage(),
  ADSubjectPage(),
  ADSubjectPage(),
  ADSubjectPage(),
];

List<BottomNavigationBarItem> items = [
  ADBottomBarItem("首页", "home"),
  ADBottomBarItem("书影音", "subject"),
  ADBottomBarItem("小组", "group"),
  ADBottomBarItem("市集", "mall"),
  ADBottomBarItem("我的", "profile"),
];