import 'package:catefavor/ui/pages/home/drawer/home_drawer.dart';
import 'package:catefavor/ui/pages/main/initialize_item.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/int_extension.dart';

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
        selectedFontSize: 14.px,
        unselectedFontSize: 14.px,
        items: items,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
      drawer: ADHomeDrawer(),
    );
  }
}
