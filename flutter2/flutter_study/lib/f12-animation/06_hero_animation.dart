import 'package:flutter/material.dart';
import 'package:flutter_study/f12-animation/pages/image_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero跳转"),
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          children: List.generate(20, (index) {
            final imageURL = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
              onTap: () => _jumpToImageDetailPage(context, imageURL),
              child: Hero(
                tag: imageURL,
                child: Image.network(imageURL, fit: BoxFit.cover),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _jumpToImageDetailPage(BuildContext context, String imageURL) {
    Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (ctx, anim1, anim2) {
        return FadeTransition(
          opacity: anim1,
          child: ADImageDetailPage(imageURL),
        );
      }),
    );
  }
}
