class Person {
  String name; // 名字
  String avatarURL; // 头像

  Person.fromJSON(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromJSON(Map<String, dynamic> json): super.fromJSON(json);
}

class Director extends Person {
  Director.fromJSON(Map<String, dynamic> json):super.fromJSON(json);
}

int counter = 1;

class MovieItem {
  int rank; // 排名
  String imageURL; // 电影URL
  String title; // 电影标题
  String playDate; // 播放日期
  double rating; // 评分
  List<String> genres; // 电影种类
  List<Actor> casts; // 演员列表
  Director director; // 导演
  String originalTitle; // 原名

  MovieItem.fromJSON(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["images"]["medium"];
    this.title = json["title"];
    this.playDate = json["year"];
    this.rating = json["rating"]["average"];
    this.genres = json["genres"].cast<String>();
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromJSON(item);
    }).toList();
    this.director = Director.fromJSON(json["directors"][0]);
    this.originalTitle = json["original_title"];
  }

  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}
