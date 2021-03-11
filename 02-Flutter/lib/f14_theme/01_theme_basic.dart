import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/f14_theme/shared/app_theme.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 1. 亮度
          brightness: Brightness.light,
          // 2. primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
          primarySwatch: Colors.blue,
          // 点击时的波纹颜色
          splashColor: Colors.blue,
          // 3. primaryColor: 单独设置导航和TabBar的颜色
          primaryColor: Colors.orange,
          // 4. accentColor: 单独设置FloatingActionButton\Switch
          accentColor: Colors.orange,
          // 5. Button的主题
          buttonTheme: ADAppTheme.buttonTheme,
          // 6. Card的主题
          cardTheme: ADAppTheme.cardTheme,
          // 7. Text的主题
          textTheme: ADAppTheme.textTheme
      ),
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return ADDetailPage();
              }
          ));
        },
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"),
            Text("Hello World", style: TextStyle(fontSize: 14),),
            Text("Hello World", style: TextStyle(fontSize: 20),),
            Text("Hello World", style: Theme.of(context).textTheme.headline1,),
            Text("Hello World", style: Theme.of(context).textTheme.headline2,),
            Switch(value: true, onChanged: (value) {},),
            CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: Colors.red,),
            RaisedButton(child: Text("R"), onPressed: () {},),
            Card(child: Text("你好啊,李银河", style: TextStyle(fontSize: 50),),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text("首页"),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text("分页"),
              icon: Icon(Icons.category)
          ),
        ],
      ),
    );
  }
}

class ADDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.yellow
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
//        backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text("Detail Page", style: Theme.of(context).textTheme.headline1,),
        ),
        // 如何单独设置accentColor的颜色
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.greenAccent
              )
          ),
          child: FloatingActionButton(
//          backgroundColor: Colors.pink,
            child: Icon(Icons.pets),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}