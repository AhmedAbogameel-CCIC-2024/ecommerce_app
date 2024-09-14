import 'package:ecommerce_app/core/models/product.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
                image: DecorationImage(
                  image: NetworkImage(product.image),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AppText(
                title: product.name,
                fontWeight: FontWeight.w700,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 12),
            AppText(
              title: '${product.price} EGP',
              color: AppColors.orange,
            ),
          ],
        ),
      ],
    );
  }
}
