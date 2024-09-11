import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        strokeWidth: 1.5,
      ),
    );
  }
}
