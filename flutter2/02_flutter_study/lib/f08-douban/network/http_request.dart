import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  // 基础设置
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseURL,
    connectTimeout: HttpConfig.timeout,
  );

  // 通过BaseOption创建Dio
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor inter}) async {
    // 1. 创建单独配置
    final options = Options(method: method);

    // 2. 默认的全局拦截器
    Interceptor globalInter = InterceptorsWrapper(
      onRequest: (request) {
        print("请求拦截");
        return request;
      },
      onResponse: (response) {
        print("响应拦截");
        return response;
      },
      onError: (error) {
        print("错误拦截");
        return error;
      },
    );

    // 创建拦截器List
    List<Interceptor> inters = [globalInter];

    // 请求单独的拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 2. 发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (error) {
      return Future.error(error);
    }
  }

//  static void get() {
//    request(url, method: get);
//  }
//
//  static void post() {
//
//  }
}
