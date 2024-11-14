import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utility/palette.dart';
import '../../../../core/utility/theme.dart';
import '../app_text.dart';

class TextAreaFieldWidget extends StatelessWidget {
  const TextAreaFieldWidget({
    super.key,
    required this.keyName,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.contentPadding,
    this.labelAboveField,
    this.maxLines,
    this.controller,
    this.onSubmitted,
    this.maxLength,
    this.onSaved,
    this.textInputAction,
  });
  final int? maxLength;
  final String keyName;
  final String? labelAboveField;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final void Function(String?)? onSubmitted;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          text: labelAboveField,
          textColor: AppTheme.inDarkMode(context,
              dark: Palette.white, light: Palette.darkBlue),
          style: AppTextStyle.medium_16,
        ),
        Padding(
          padding: labelAboveField != null
              ? EdgeInsets.only(top: 10.h)
              : EdgeInsets.zero,
          child: FormBuilderTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: textInputAction ?? TextInputAction.done,
            maxLines: maxLines ?? 9,
            maxLength: maxLength,
            controller: controller,
            onSaved: onSaved,
            name: keyName,
            onSubmitted: onSubmitted,
            validator: validator,
            decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Palette.red_FF0606),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Palette.grey_9C9C9C),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Palette.grey_9C9C9C),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Palette.grey_9C9C9C),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Palette.red_FF0606),
                ),
                errorStyle: TextStyle(
                  color: Palette.red_FF0606,
                ),
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 17.w,
                    ),
                hintText: hintText,
                hintStyle: hintStyle,
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
}
