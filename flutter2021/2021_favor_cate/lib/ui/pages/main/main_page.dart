import 'package:favor_cate/ui/pages/home/drawer/drawer_page.dart';
import 'package:favor_cate/ui/pages/main/initialize_item.dart';
import 'package:flutter/material.dart';

class ADMainPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _ADMainPageState createState() => _ADMainPageState();
}

class _ADMainPageState extends State<ADMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedFontSize: 14,
        // 高亮颜色
        // fixedColor: Colors.green,
        // 超过4个要设置此属性, 不然, 文字就会显示不出来
        type: BottomNavigationBarType.fixed,
      ),
      drawer: ADHomeDrawerPage(),
    );
  }
}
