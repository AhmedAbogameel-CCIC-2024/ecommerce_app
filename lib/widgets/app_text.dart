import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/utils/colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.title,
    this.fontWeight,
    this.fontSize = 14,
    this.color = AppColors.black,
    this.decoration,
    this.height,
    this.onTap,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final String title;
  final FontWeight? fontWeight;
  final double fontSize;
  final double? height;
  final Color color;
  final TextDecoration? decoration;
  final void Function()? onTap;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            decoration: decoration,
            height: height != null ? height! / fontSize : null,
          ),
        ),
      ),
    );
  }
}