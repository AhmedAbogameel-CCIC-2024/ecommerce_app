import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/caching_utils/caching_utils.dart';
import 'package:ecommerce_app/core/network_utils/network_utils.dart';
import 'package:ecommerce_app/widgets/app_snack_bar.dart';

class UserDatasource {
  Future<bool> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      });
      if (image != null)
        formData.files.add(
          MapEntry(
            'image',
            await MultipartFile.fromFile(image.path),
          ),
        );
      final response = await NetworkUtils.post(
        'register',
        data: formData,
      );
      final success = response.data['status'] == true;
      if (success) {
        await CachingUtils.cacheUser(response.data['data']);
      }
      showSnackBar(
        response.data['message'],
        isError: !success,
      );
      return success;
    } catch (e, s) {
      showSnackBar(e.toString());
      print(e);
      print(s);
    }
    return false;
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await NetworkUtils.post(
        'login',
        data: FormData.fromMap({
          "email": email,
          "password": password
        }),
      );
      final success = response.data['status'] == true;
      if (success) {
        await CachingUtils.cacheUser(response.data['data']);
      }
      showSnackBar(
        response.data['message'],
        isError: !success,
      );
      return success;
    } catch (e, s) {
      showSnackBar(e.toString());
      print(e);
      print(s);
    }
    return false;
  }
}
