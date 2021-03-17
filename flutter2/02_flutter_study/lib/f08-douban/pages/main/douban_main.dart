import 'package:flutter/material.dart';
import 'initialize_item.dart';

class ADMainPage extends StatefulWidget {
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
        items: items,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.green,
        // fixedColor: Colors.green,
        // 超过4个要设置此属性, 不然, 文字就会显示不出来
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
