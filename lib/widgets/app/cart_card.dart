import 'package:ecommerce_app/core/models/product_cart.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';

class CartCard extends StatefulWidget {
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
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${widget.product.id}'),
      onDismissed: (direction) {
        widget.onDelete();
      },
      child: Row(
        children: [
          Image.network(
            widget.product.product.image,
            height: 64,
            width: 64,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: widget.product.product.name,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: AppText(
                        title: '${widget.product.product.price} EGP',
                        color: AppColors.orange,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.onDecrease();
                        setState(() {});
                      },
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
                      title: '${widget.product.quantity}',
                      fontWeight: FontWeight.w700,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      fontSize: 20,
                    ),
                    InkWell(
                      onTap: () {
                        widget.onIncrease();
                        setState(() {});
                      },
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
