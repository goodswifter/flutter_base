import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../favor/favor.dart';

List<Widget> pages = [
  ADHomePage(),
  ADFavorPage(),
//  ADSubjectPage(),
//  ADSubjectPage(),
//  ADSubjectPage(),
];

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
      title: Text("收藏"),
      icon: Icon(Icons.star)
  ),
];

//List<BottomNavigationBarItem> items = [
//  ADBottomBarItem("首页", "home"),
//  ADBottomBarItem("书影音", "subject"),
//  ADBottomBarItem("小组", "group"),
//  ADBottomBarItem("市集", "mall"),
//  ADBottomBarItem("我的", "profile"),
//];