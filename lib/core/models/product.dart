class Product {
  final int id;
  final num price;
  final num oldPrice;
  final String image;
  final String name;
  final String description;
  final bool inFavourite;
  bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavourite,
    required this.inCart,
  });

  factory Product.fromJson(Map<String,dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      inFavourite: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
