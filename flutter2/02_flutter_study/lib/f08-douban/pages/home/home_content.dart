import 'package:flutter/material.dart';

class ADHomeContent extends StatefulWidget {
  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 60,
        itemBuilder: (ctx, index) {
          // return ADHomeMovieItem(movies[index]);
          return Text("联系人$index");
        });
  }
}
