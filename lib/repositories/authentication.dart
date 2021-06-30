import 'package:dio/dio.dart';
import 'package:test_flutter_app/model/news.dart';

class AuthenticationRepository {

  Future<String> getToken() async {
    try {
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8";
      var response = await dio.post('https://app.ferfit.club/api/auth/refresh-tokens');
      if (response.statusCode == 200) {
        return response.data['result']['access'];
      } else {
        return "No answer";
      }
    } catch (e) {
      //throw Exception("Exception: $e ");
      return "false";
    }
  }

  Future<List<News>> getNews(String token) async {
    try {
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "bearer $token";
      var response = await dio.get('https://app.ferfit.club/api/feed', queryParameters: {'limit': 10, 'offset': 0, 'maxDate': "2021-05-06T18:26:42.820994"});
      //print('response: ' + response.data['result']['posts'].toString());
      return (response.data['result']['posts'] as List)
          .map((e) => News.fromJson(e))
          .toList();

    } catch (e) {
      throw Exception("Exception: $e ");
    }
  }

}