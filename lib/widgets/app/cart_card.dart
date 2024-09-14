import 'package:ecommerce_app/core/models/product_cart.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  }) : super(key: key);

  final ProductCart product;
  final void Function() onIncrease;
  final void Function() onDecrease;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${product.id}'),
      onDismissed: (direction) {
        onDelete();
      },
      child: Row(
        children: [
          Image.network(
            product.product.image,
            height: 64,
            width: 64,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: product.product.name,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: AppText(
                        title: '${product.product.price} EGP',
                        color: AppColors.orange,
                      ),
                    ),
                    InkWell(
                      onTap: onDecrease,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 16,
                        child: Icon(
                          Icons.remove,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    AppText(
                      title: '${product.quantity}',
                      fontWeight: FontWeight.w700,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      fontSize: 20,
                    ),
                    InkWell(
                      onTap: onIncrease,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 16,
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
