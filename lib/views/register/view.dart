import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/views/register/cubit.dart';
import 'package:ecommerce_app/widgets/app_button.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:ecommerce_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_loading_indicator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<RegisterCubit, RegisterStates>(
            builder: (context, state) {
              final cubit = RegisterCubit.of(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    AppText(
                      title: 'Register',
                      fontSize: 40,
                    ),
                    SizedBox(height: 12),
                    UnconstrainedBox(
                      child: InkWell(
                        onTap: cubit.pickImage,
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Icon(
                            Icons.photo,
                            color: AppColors.grey,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.grey.withOpacity(0.5),
                            image: cubit.image == null ? null : DecorationImage(
                              image: FileImage(cubit.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    AppTextField(
                      label: 'Name',
                      validator: Validator.fullName,
                      onSaved: (v) => cubit.name = v,
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      label: 'Phone',
                      validator: Validator.phone,
                      onSaved: (v) => cubit.phone = v,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      label: 'Email',
                      validator: Validator.email,
                      onSaved: (v) => cubit.email = v,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      label: 'Password',
                      secure: true,
                      validator: Validator.password,
                      onSaved: (v) => cubit.password = v,
                    ),
                    SizedBox(height: 40),
                    AppButton(
                      title: 'Register',
                      isLoading: state is RegisterLoading,
                      onTap: cubit.register,
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: 'Have an account?',
                        ),
                        SizedBox(width: 4),
                        AppText(
                          title: 'Login',
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          onTap: () => RouteUtils.pop(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
