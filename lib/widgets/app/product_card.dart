import 'package:ecommerce_app/core/datasources/cart.dart';
import 'package:ecommerce_app/core/models/product.dart';
import 'package:ecommerce_app/widgets/app_loading_indicator.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLoading = false;

  void rebuild() {
    if (mounted) {
      setState(() {});
    }
  }

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
                  image: NetworkImage(widget.product.image),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: isLoading ? AppLoadingIndicator() : InkWell(
                onTap: () async {
                  isLoading = true;
                  rebuild();
                  final result = await CartDatasource().addOrRemoveProduct(
                    id: widget.product.id,
                  );
                  if (result) {
                    widget.product.inCart = !widget.product.inCart;
                  }
                  isLoading = false;
                  rebuild();
                },
                child: CircleAvatar(
                  backgroundColor: widget.product.inCart ? AppColors.red : AppColors.primary,
                  child: Icon(
                    widget.product.inCart ? Icons.remove : Icons.add,
                    color: AppColors.white,
                  ),
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
                title: widget.product.name,
                fontWeight: FontWeight.w700,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 12),
            AppText(
              title: '${widget.product.price} EGP',
              color: AppColors.orange,
            ),
          ],
        ),
      ],
    );
  }
}
