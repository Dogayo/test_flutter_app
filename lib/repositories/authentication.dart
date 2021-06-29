import 'package:dio/dio.dart';
import 'package:test_flutter_app/model/response.dart';
import 'dart:convert' as json;

class AuthenticationRepository {

  Future<String> getToken() async {
    try {
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8";
      var response = await dio.post('https://app.ferfit.club/api/auth/refresh-tokens');
      //print(response.data['result']['access']);
      return response.data['result']['access'];
    } catch (e) {
      throw Exception("Exception occured: $e ");
    }
  }

}