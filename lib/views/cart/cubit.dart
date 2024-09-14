import 'package:ecommerce_app/core/datasources/cart.dart';
import 'package:ecommerce_app/core/models/product_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/cart.dart';

part 'states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInit());

  static CartCubit of(context) => BlocProvider.of(context);

  final _datasource = CartDatasource();

  Cart? cart;

  Future<void> getCart({bool isLoading = true}) async {
    if (isLoading) _emit(CartLoading());
    cart = await _datasource.getCart();
    _emit(CartInit());
  }

  Future<void> deleteProduct(ProductCart value) async {
    cart!.products.remove(value);
    _emit(CartInit());
    await _datasource.deleteProduct(value.id);
    getCart(isLoading: false);
  }

  void _emit(CartStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}