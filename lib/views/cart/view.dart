import 'package:ecommerce_app/views/cart/cubit.dart';
import 'package:ecommerce_app/widgets/app_button.dart';
import 'package:ecommerce_app/widgets/app_loading_indicator.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/colors.dart';
import '../../widgets/app/cart_card.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            final cubit = CartCubit.of(context);
            final cart = cubit.cart;
            if (state is CartLoading) {
              return AppLoadingIndicator();
            } else if (cart == null) {
              return Center(child: AppText(title: 'Error'));
            } else if (cart.products.isEmpty) {
              return Center(child: AppText(title: 'Empty cart'));
            }
            final products = cubit.cart!.products;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: products.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final product =  products[index];
                        return CartCard(
                          product: product,
                          onDelete: () => cubit.deleteProduct(product),
                          onIncrease: () {
                            product.quantity++;
                            cubit.updateProduct(value: product);
                          },
                          onDecrease: () {
                            if (product.quantity <= 1) {
                              return;
                            }
                            product.quantity--;
                            cubit.updateProduct(value: product);
                          },
                        );
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
                          title: '${cart.total} EGP',
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
            );
          },
        ),
      ),
    );
  }
}
