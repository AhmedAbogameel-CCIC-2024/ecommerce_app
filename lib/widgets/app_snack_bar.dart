import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

void showSnackBar(String title, {bool isError = false}) {
  ScaffoldMessenger.of(RouteUtils.context).hideCurrentSnackBar();
  ScaffoldMessenger.of(RouteUtils.context).showSnackBar(
    SnackBar(
      content: Center(
        child: AppText(
          title: title,
          color: AppColors.white,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   label: 'Close',
      //   onPressed: ScaffoldMessenger.of(RouteUtils.context).hideCurrentSnackBar,
      // ),
      backgroundColor: isError ? AppColors.red : AppColors.primary,
      duration: Duration(seconds: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}