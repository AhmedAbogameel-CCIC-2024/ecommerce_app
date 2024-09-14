import 'package:ecommerce_app/core/models/product.dart';
import 'package:ecommerce_app/core/models/product_category.dart';
import 'package:ecommerce_app/core/network_utils/network_utils.dart';
import 'package:ecommerce_app/widgets/app_snack_bar.dart';

class ProductDatasource {
  Future<List<ProductCategory>> getCategories() async {
    try {
      final response = await NetworkUtils.get('categories');
      final success = (response.statusCode ?? 0) <= 299;
      if (success) {
        return (response.data['data']['data'] as List).map((e) => ProductCategory.fromJson(e)).toList();
      }
      showSnackBar(
        response.data['message'],
        isError: !success,
      );
    } catch (e, s) {
      print(e);
      print(s);
    }
    return [];
  }

  Future<List<Product>> getProducts({required int categoryID}) async {
    try {
      final response = await NetworkUtils.get('categories/$categoryID');
      final success = (response.statusCode ?? 0) <= 299;
      if (success) {
        return (response.data['data']['data'] as List).map((e) => Product.fromJson(e)).toList();
      }
      showSnackBar(
        response.data['message'],
        isError: !success,
      );
    } catch (e, s) {
      print(e);
      print(s);
    }
    return [];
  }
}
