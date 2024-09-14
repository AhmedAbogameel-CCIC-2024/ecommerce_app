import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/caching_utils/caching_utils.dart';

abstract class NetworkUtils {
  static Dio _dio = Dio();

  static Future<void> init() async {
    _dio.options = BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      validateStatus: (status) => true,
      headers: {'lang': 'en'}
    );
  }

  static Future<Response> get(String path) async {
    if (CachingUtils.isLogged) {
      _dio.options.headers.addAll({'Authorization': CachingUtils.user!.token});
    }
    return _dio.get(path);
  }

  static Future<Response> post(String path, {FormData? formData}) async {
    if (CachingUtils.isLogged) {
      _dio.options.headers.addAll({'Authorization': CachingUtils.user!.token});
    }
    return _dio.post(
      path,
      data: formData,
    );
  }

  static Future<Response> put(String path, {FormData? formData}) async {
    if (CachingUtils.isLogged) {
      _dio.options.headers.addAll({'Authorization': CachingUtils.user!.token});
    }
    return _dio.put(
      path,
      data: formData,
    );
  }

  static Future<Response> delete(String path, {FormData? formData}) async {
    if (CachingUtils.isLogged) {
      _dio.options.headers.addAll({'Authorization': CachingUtils.user!.token});
    }
    return _dio.delete(
      path,
      data: formData,
    );
  }
}
