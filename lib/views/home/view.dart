import 'package:ecommerce_app/core/caching_utils/caching_utils.dart';
import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/views/home/cubit.dart';
import 'package:ecommerce_app/views/login/view.dart';
import 'package:ecommerce_app/widgets/app_loading_indicator.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app/category_card.dart';
import '../../widgets/app/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: AppText(title: 'Home'),
          actions: [
            IconButton(
              onPressed: () {
                CachingUtils.clearCache();
                RouteUtils.pushAndRemoveAll(LoginView());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            final cubit = HomeCubit.of(context);
            if (state is HomeCategoriesLoading) {
              return AppLoadingIndicator();
            }
            final categories = cubit.categories;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryCard(
                          isSelected: cubit.selectedCategory == category,
                          onTap: () => cubit.selectCategory(category),
                          category: category,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 12),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (state is HomeProductsLoading) {
                          return AppLoadingIndicator();
                        }
                        final products = cubit.products;
                        return ListView.separated(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: products[index]);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16),
                        );
                      }
                    ),
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
