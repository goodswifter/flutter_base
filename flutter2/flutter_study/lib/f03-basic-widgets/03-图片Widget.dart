import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("图片Widget"),
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
    return Container(
      child: Column(
        children: [
          // 网络图片
          NetworkImageWidget(),
          // 本地图片
          AssetImageWidget(),
          // 占位图
          PlaceholderImageWidget(),
        ],
      ),
    );
  }
}

class PlaceholderImageWidget extends StatelessWidget {
  final String imageURL =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_110915%2F1109151356c0717d7e6a91e985.jpg&refer=http%3A%2F%2Fattachments.gfan.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1617270747&t=b6ab76d4e2c4cebdf8a00470424e5f29";
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/haha.jpg',
      image: imageURL,
      width: 200,
      height: 100,
      fadeInDuration: Duration(seconds: 1),
      fadeOutDuration: Duration(seconds: 1),
    );
  }
}

// 1. 在Flutter项目中创建一个文件夹, 存储图片
// 2. 在pubspec.yaml进行配置
// 3. 使用图片
class AssetImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/haha.jpg"),
      width: 200,
      height: 100,
    );
  }
}

class NetworkImageWidget extends StatelessWidget {
  final String imageURL =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_110915%2F1109151356c0717d7e6a91e985.jpg&refer=http%3A%2F%2Fattachments.gfan.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1617270747&t=b6ab76d4e2c4cebdf8a00470424e5f29";

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageURL),
      width: 200,
      height: 100,
      fit: BoxFit.contain,
      repeat: ImageRepeat.repeatY,
      // 范围(-1, 1)
      alignment: Alignment(-1, -1),
    );
  }
}