import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInit());

  static CartCubit of(context) => BlocProvider.of(context);


  void _emit(CartStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}