import 'package:favor_cate/ui/pages/favor/favor_page.dart';
import 'package:favor_cate/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  ADHomePage(),
  ADFavorPage(),
];

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "首页",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: "收藏",
  ),
];

// 封装BottomNavigationBarItem
//List<BottomNavigationBarItem> items = [
//  ADBottomNavigationBarItem("首页", "home"),
//  ADBottomNavigationBarItem("书影音", "subject"),
//  ADBottomNavigationBarItem("小组", "group"),
//  ADBottomNavigationBarItem("市集", "mall"),
//  ADBottomNavigationBarItem("我的", "profile"),
//];
