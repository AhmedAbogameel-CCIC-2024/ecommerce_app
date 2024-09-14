import 'package:ecommerce_app/views/cart/view.dart';
import 'package:ecommerce_app/views/home/view.dart';
import 'package:ecommerce_app/views/nav_bar/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          final cubit = NavBarCubit.of(context);
          final currentViewIndex = cubit.currentViewIndex;
          return Scaffold(
            body: [
              HomeView(),
              CartView(),
            ][currentViewIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart',
                ),
              ],
              currentIndex: currentViewIndex,
              onTap: cubit.changeView,
            ),
          );
        },
      ),
    );
  }
}
