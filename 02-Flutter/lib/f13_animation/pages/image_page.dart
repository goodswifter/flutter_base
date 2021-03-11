import 'package:flutter/material.dart';

class ADImageDetailPage extends StatelessWidget {
  final String _imageURL;

  ADImageDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Hero(tag: _imageURL, child: Image.network(_imageURL),),
        ),
      ),
    );
  }
}
