import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import '../../service/config.dart';
import '../../widgets/dashed_line.dart';
import '../../widgets/star_rating.dart';

class ADHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  ADHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter()
        ],
      ),
    );
  }

  // 1. 头部的布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 2. 内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                buildContentInfo(),
                SizedBox(
                  width: 8,
                ),
                buildContentLine(),
                SizedBox(
                  width: 8,
                ),
                buildContentWish()
              ],
            ),
          ),
        )
      ],
    );
  }

  // 2.1 内容的图片
  Widget buildContentImage() {
    return Container(
      height: 150,
      width: 100,
      child: Stack(
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder: kAssetPlaceholderImage,
                image: movie.imageURL,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2.2 内容的信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(
            width: 8,
          ),
          buildContentInfoRate(),
          SizedBox(
            width: 8,
          ),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  // 2.2.1 内容信息的标题
  Widget buildContentInfoTitle() {
    List<WidgetSpan> titleRuneList = movie.title.runes.map((rune) {
      return WidgetSpan(child: Text(String.fromCharCode(rune), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), alignment: PlaceholderAlignment.middle);
    }).toList();

    return Text.rich(TextSpan(children: [
      WidgetSpan(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.pink,
            size: 30,
          ),
          alignment: PlaceholderAlignment.middle),
      ...titleRuneList,
      WidgetSpan(
          child: Text("(${movie.playDate})"),
          style: TextStyle(fontSize: 18, color: Colors.grey),)
    ]),);
  }

  // 2.2.2 内容信息的评分
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        ADStarRating(
          rating: movie.rating,
          size: 20,
        ),
        Text(
          "${movie.rating}",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  // 2.2.1 内容信息的描述
  Widget buildContentInfoDesc() {
    // 电影种类
    final genresString = movie.genres.join(" ");
    // 导演
    final directorString = movie.director.name;
    // 演员
    // List<Actor> casts = movie.casts;
    final castsString = movie.casts.map((items) => items.name).join(" ");

    return Text(
      "$genresString / $directorString / $castsString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  // 2.3 内容的虚线
  Widget buildContentLine() {
    return Container(
//      height: 100,
      child: ADDashedLine(
        axis: Axis.vertical,
        dashedWidth: .4,
        dashedHeight: 6,
        color: Colors.pink,
      ),
    );
  }

  // 2.4 内容的想看按钮
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/home/wish.png",
            width: 40,
            height: 40,
          ),
          Text(
            "想看",
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }

  // 3. 尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(8)),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}
