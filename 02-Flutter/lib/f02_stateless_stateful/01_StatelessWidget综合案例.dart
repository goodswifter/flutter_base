import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ADHomePage(), debugShowCheckedModeBanner: false);
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品列表")),
      body: ADHomeContent(),
    );
  }
}

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ADHomeProductItem("Apple1", "Macbook1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(
          height: 6,
        ),
        ADHomeProductItem("Apple2", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(
          height: 20,
        ),
        ADHomeProductItem("Apple3", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class ADHomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  final titleStyle = TextStyle(fontSize: 26, color: Colors.red);
  final descStyle = TextStyle(fontSize: 20, color: Colors.green);
  
  final borderSize = BorderSide().copyWith(color: Colors.green, width: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12), // 内边距
      // 装饰
      decoration: BoxDecoration(
          border: Border(top: borderSize)
//        border: Border.all(
//          width: 5, // 边框的宽度
//          color: Colors.pink // 边框的颜色
//        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(height: 8,),
          Row(
//          mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                desc,
                style: descStyle,
                textAlign: TextAlign.right,
              )
            ],
          ),
          SizedBox(height: 8,),
          Image.network(imageURL)
        ],
      ),
    );
  }

  ADHomeProductItem(this.title, this.desc, this.imageURL);
}
