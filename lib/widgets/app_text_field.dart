import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
import 'app_text.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.validator,
    this.secure = false,
    this.leading,
    this.onSaved,
    this.textInputType,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? Function(String? v)? validator;
  final void Function(String? v)? onSaved;
  final bool secure;
  final Widget? leading;
  final TextInputType? textInputType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool secure = false;

  @override
  void initState() {
    secure = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          AppText(
            title: widget.label!,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 8),
        ],
        TextFormField(
          cursorColor: AppColors.primary,
          validator: widget.validator,
          obscureText: secure,
          obscuringCharacter: '*',
          onSaved: widget.onSaved,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.leading,
            fillColor: AppColors.grey.withOpacity(0.2),
            filled: true,
            suffixIcon: widget.secure ? InkWell(
              onTap: () => setState(() => secure = !secure),
              child: Icon(
                secure ? Icons.remove_red_eye : Icons.visibility_off,
                size: 16,
                color: AppColors.grey,
              ),
            ) : SizedBox(),
            hintStyle: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            enabledBorder: getBorder(color: Colors.transparent),
            focusedBorder: getBorder(color: AppColors.grey),
            errorBorder: getBorder(color: AppColors.red),
            focusedErrorBorder: getBorder(color: AppColors.red),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder getBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}