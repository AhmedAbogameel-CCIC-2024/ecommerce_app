import 'package:ecommerce_app/widgets/app_loading_indicator.dart';
import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isLoading = false,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  final String title;
  final bool isLoading;
  final void Function()? onTap;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Builder(
        builder: (context) {
          if (isLoading) {
            return AppLoadingIndicator();
          }
          return InkWell(
            onTap: onTap,
            child: Container(
              height: 48,
              alignment: Alignment.center,
              child: AppText(
                title: title,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      ),
    );
  }
}