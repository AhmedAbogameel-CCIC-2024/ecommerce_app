import 'dart:async';

import 'package:dio/dio.dart';

abstract class NetworkUtils {
  static Dio _dio = Dio();

  static Future<void> init() async {
    _dio.options = BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      validateStatus: (status) => true,
    );
  }

  static Future<Response> get(String path) async {
    return _dio.get(path);
  }

  static Future<Response> post(String path, {FormData? formData}) async {
    return _dio.post(
      path,
      data: formData,
    );
  }
}
