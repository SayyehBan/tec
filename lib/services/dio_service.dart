// ignore_for_file: invalid_return_type_for_catch_error

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/utilities/storage_const.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((response) {
      return response;
    }).catchError((error) {
      if (error.response != null) {
        return error.response!;
      }

      return null;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    var token = GetStorage().read(StorageKey.token);
    if (token != null) {
      dio.options.headers['authorization'] = '$token';
    }
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((value) {
      debugPrint(value.headers.toString());
      debugPrint(value.data.toString());
      debugPrint(value.statusCode.toString());
      return value;
    }).catchError((error) {
      if (error is DioError) {
        return error.response!;
      }
      return null;
    });
  }
}
