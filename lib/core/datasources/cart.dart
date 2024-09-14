import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_utils/network_utils.dart';
import 'package:ecommerce_app/widgets/app_snack_bar.dart';

class CartDatasource {
  Future<bool> addOrRemoveProduct({required int id}) async {
    try {
      final response = await NetworkUtils.post(
        'carts',
        formData: FormData.fromMap({'product_id': id}),
      );
      final success = (response.statusCode ?? 0) <= 299;
      showSnackBar(
        response.data['message'],
        isError: !success,
      );
      return success;
    } catch (e) {}
    return false;
  }
}
