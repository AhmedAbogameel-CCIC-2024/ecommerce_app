import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentViewIndex = 0;

  void changeView(int value) {
    currentViewIndex = value;
    emit(NavBarInit());
  }
}