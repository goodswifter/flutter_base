import 'package:flutter/material.dart';

class ADImageDetailPage extends StatelessWidget {
  final String _imageURL;

  ADImageDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    double startY;
    double verticalDelta;
    return GestureDetector(
      onTap: () {
        print("11");
        Navigator.of(context).pop();
      },
      onVerticalDragStart: (details) {
        startY = details.localPosition.dy;
        print(details.localPosition.dy);
      },
      onVerticalDragUpdate: (details) {
        verticalDelta = details.localPosition.dy - startY;
        if (verticalDelta > 10) {
          print(verticalDelta);
        }
      },
      onVerticalDragEnd: (details) {
        if (verticalDelta > 10) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
          child: Hero(tag: _imageURL, child: Image.network(_imageURL)),
        ),
      ),
    );
  }
}
