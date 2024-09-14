import 'package:ecommerce_app/widgets/app_button.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../../widgets/app/cart_card.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CartCard();
                },
                separatorBuilder: (context, index) => Divider(height: 40),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                AppText(
                  title: 'Total',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                Expanded(
                  child: AppText(
                    title: '58239 EGP',
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontSize: 16,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            AppButton(
              title: 'Checkout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
