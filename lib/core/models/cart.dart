import 'package:ecommerce_app/core/models/product_cart.dart';

class Cart {
  final num total;
  final List<ProductCart> products;

  Cart({
    required this.total,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      total: json['total'],
      products: (json['cart_items'] as List).map((e) => ProductCart.fromJson(e)).toList(),
    );
  }
}
