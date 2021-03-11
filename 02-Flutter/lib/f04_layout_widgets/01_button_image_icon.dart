import 'package:flutter/material.dart';

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Icon字体图标和图片图标
    // 1.字体图标矢量图(放大的时候不会失真)
    // 2.字体图标可以设置颜色
    // 3.图标很多时, 占据空间更小
//    return Icon(Icons.pets, size: 300, color: Colors.orange,);
//    return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
    // 1.0xe91d -> unicode编码
    // 2.设置对应的字体
    return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"),);
  }
}

class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    // 1.占位图的问题: FadeInImage
    // 2.图片缓存: 1000张 100m
    return FadeInImage.assetNetwork(
        fadeOutDuration: Duration(milliseconds: 1),
        fadeInDuration: Duration(milliseconds: 1),
        placeholder: 'assets/images/haha.jpg',
        image: imageURL
    );
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. 默认情况下Button上下有一定的间距
    // 2. Button变小: ButtonTheme
    // 3. 去除Button的内边距
    return Column(
      children: <Widget>[
        ButtonTheme(
          minWidth: 10,
          height: 10,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.red,
            textColor: Colors.white,
            // 设置为MaterialTapTargetSize.shrinkWrap时，button距顶部距离为0；
            // 设置为MaterialTapTargetSize.padded时距顶部和下部有一个距离
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(
              Icons.pets,
              color: Colors.white,
              size: 20,
            ),
//          child: Text("FlatButton1"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}