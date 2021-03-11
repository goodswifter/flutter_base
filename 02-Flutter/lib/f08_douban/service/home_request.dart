import '../service/http_request.dart';
import '../model/home_model.dart';
import 'config.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList({int start = 0}) async {
    // 1. 构建URL
//    final movieURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    final movieURL = "/movie/top250";

    // 2. 发送网络请求获取结果
    final result = await HttpRequest.request(movieURL);
    final subjects = result["subjects"];

    // 3. 将Map转化成Model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromJSON(sub));
    }

    return movies;
  }
}