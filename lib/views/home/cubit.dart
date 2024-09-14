import 'package:ecommerce_app/core/datasources/product.dart';
import 'package:ecommerce_app/core/models/product_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/product.dart';

part 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  final _datasource = ProductDatasource();

  ProductCategory? selectedCategory;

  List<ProductCategory> categories = [];
  List<Product> products = [];

  Future<void> getCategories() async {
    _emit(HomeCategoriesLoading());
    categories = await _datasource.getCategories();
    selectedCategory = categories.first;
    getProducts();
    _emit(HomeInit());
  }

  Future<void> getProducts() async {
    products.clear();
    _emit(HomeProductsLoading());
    products = await _datasource.getProducts(categoryID: selectedCategory!.id);
    _emit(HomeInit());
  }

  void selectCategory(ProductCategory value) {
    if (selectedCategory == value) {
      return;
    }
    selectedCategory = value;
    getProducts();
  }


  void _emit(HomeStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}