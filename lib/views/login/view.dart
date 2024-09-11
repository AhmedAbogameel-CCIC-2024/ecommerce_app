import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/views/login/cubit.dart';
import 'package:ecommerce_app/widgets/app_button.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:ecommerce_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<LoginCubit, LoginStates>(
          builder: (context, state) {
            final cubit = LoginCubit.of(context);
            return Form(
              key: cubit.formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  AppText(
                    title: 'Login',
                    fontSize: 40,
                  ),
                  SizedBox(height: 64),
                  AppTextField(
                    label: 'Email',
                    onSaved: (v) => cubit.email = v,
                    validator: Validator.email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    label: 'Password',
                    secure: true,
                    onSaved: (v) => cubit.password = v,
                    validator: Validator.password,
                  ),
                  SizedBox(height: 40),
                  AppButton(
                    title: 'Login',
                    isLoading: state is LoginLoading,
                    onTap: cubit.login,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: 'Don\'t have an account?',
                      ),
                      SizedBox(width: 4),
                      AppText(
                        title: 'Register',
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        onTap: () => RouteUtils.push(RegisterView()),
                      ),
                    ],
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
