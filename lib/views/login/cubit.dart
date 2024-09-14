import 'package:ecommerce_app/core/datasources/user.dart';
import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/views/home/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../nav_bar/view.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  Future<void> login() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    final result = await UserDatasource().login(
      email: email!,
      password: password!,
    );
    emit(LoginInit());
    if (result) {
      RouteUtils.pushAndRemoveAll(NavBarView());
    }
  }
}