import 'dart:io';

import 'package:ecommerce_app/core/datasources/user.dart';
import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/views/login/view.dart';
import 'package:ecommerce_app/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../home/view.dart';
import '../nav_bar/view.dart';

part 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInit());

  static RegisterCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  File? image;
  String? name;
  String? phone;
  String? email;
  String? password;

  Future<void> register() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoading());
    final result = await UserDatasource().register(
      name: name!,
      phone: phone!,
      email: email!,
      password: password!,
      image: image,
    );
    emit(RegisterInit());
    if (result) {
      RouteUtils.pushAndRemoveAll(NavBarView());
    }
  }

  Future<void> pickImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      image = File(result.path);
      emit(RegisterInit());
    }
  }
}