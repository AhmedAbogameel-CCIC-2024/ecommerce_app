import 'package:ecommerce_app/core/models/product.dart';

class ProductCart {
  final int id;
  final int quantity;
  final Product product;

  ProductCart({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    return ProductCart(
      id: json['id'],
      quantity: json['quantity'],
      product: Product.fromJson(json['product']),
    );
  }
}
