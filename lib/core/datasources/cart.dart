import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_utils/network_utils.dart';
import 'package:ecommerce_app/widgets/app_snack_bar.dart';

import '../models/cart.dart';

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

  Future<Cart?> getCart() async {
    try {
      final response = await NetworkUtils.get('carts');
      final success = (response.statusCode ?? 0) <= 299;
      if (success) {
        return Cart.fromJson(response.data['data']);
      }
      showSnackBar(response.data['message'], isError: true,);
    } catch(_) {}
    return null;
  }

  Future<bool> deleteProduct(int id) async {
    try {
      final response = await NetworkUtils.delete('carts/$id');
      final success = (response.statusCode ?? 0) <= 299;
      showSnackBar(
        response.data['message'],
        isError: true,
      );
      return success;
    } catch(_) {}
    return false;
  }
}
