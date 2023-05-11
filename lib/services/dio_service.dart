import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}
