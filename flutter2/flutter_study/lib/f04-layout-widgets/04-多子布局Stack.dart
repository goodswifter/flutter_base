import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("多子布局Stack"),
        ),
        body: ADHomeBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StackWidget01(),
        StackWidget02(),
      ],
    );
  }
}

class StackWidget02 extends StatefulWidget {
  @override
  _StackWidget02State createState() => _StackWidget02State();
}

class _StackWidget02State extends State<StackWidget02> {
  bool _isFavor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/haha.jpg"),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            // symmetric: 对称的
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromARGB(150, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "进击的巨人挺不错的",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavor ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavor = !_isFavor;
                    });
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StackWidget01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        // fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Image.asset(
            "assets/images/haha.jpg",
            width: 300,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 20,
            bottom: -50,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
            ),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: Text(
              "进击的巨人",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
