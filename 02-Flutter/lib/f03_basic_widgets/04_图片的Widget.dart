import 'package:flutter/material.dart';

class AssetImageDemo extends StatelessWidget {
  const AssetImageDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      // 1. 在Flutter项目中创建一个文件夹,存储图片
      // 2. 在pubspec.yaml进行配置
      // 3. 使用图片
      image: AssetImage("assets/images/haha.jpg"),
    );
  }
}

class NetworkImageDemo extends StatelessWidget {
  const NetworkImageDemo({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image(
//      color: Colors.green,
      colorBlendMode: BlendMode.colorDodge,
      image: NetworkImage(imageURL),
      width: 300,
      height: 300,
      fit: BoxFit.contain,
      repeat: ImageRepeat.repeatY,
//      alignment: Alignment.bottomCenter,
      // 范围: -1 1
      alignment: Alignment(0, 0),
    );
  }
}