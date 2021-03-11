import 'package:flutter/material.dart';

class StackDemo02 extends StatelessWidget {
  const StackDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
              children: <Widget>[
                Text(
                  "进击的巨人挺不错的",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () => print("点击了收藏"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StackDemo01 extends StatelessWidget {
  const StackDemo01({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
//      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
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
            )),
        Positioned(
            right: 10,
            top: 20,
            child: Text(
              "进击的巨人",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ))
      ],
    );
  }
}