import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/language_helper.dart';
import '../../../../core/utility/palette.dart';
import '../../../../core/utility/theme.dart';
import '../app_text.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.keyName,
      this.validator,
      this.hintText,
      this.hintStyle,
      this.suffixIcon,
      this.contentPadding,
      this.labelAboveField,
      this.maxLines,
      this.prefixIcon,
      this.initalValue,
      this.controller,
      this.readOnly = false,
      this.align,
      this.textDirection,
      this.maxLength,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.onChanged});
  final void Function(dynamic value)? onChanged;
  final String keyName;
  final String? labelAboveField;
  final String? hintText;
  final String? initalValue;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final TextEditingController? controller;
  final bool readOnly;
  final TextAlign? align;
  final TextDirection? textDirection;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelAboveField != null)
          AppText(
            text: labelAboveField,
            textColor: AppTheme.inDarkMode(context,
                dark: Palette.white, light: Palette.black_2A2A2A),
            style: AppTextStyle.medium_16,
          ),
        Padding(
          padding: labelAboveField != null
              ? EdgeInsets.only(top: 10.h)
              : EdgeInsets.zero,
          child: SizedBox(
            //  height: 56.h,
            child: FormBuilderTextField(
              onChanged: onChanged,
              //onSubmitted: (value) => FocusScope.of(context).nextFocus(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              textInputAction: textInputAction ?? TextInputAction.next,
              keyboardType: keyboardType ?? TextInputType.text,
              textAlign: align ?? TextAlign.start,
              textDirection: textDirection ??
                  (LanguageHelper.isAr(context)
                      ? TextDirection.rtl
                      : TextDirection.ltr),
              readOnly: readOnly,
              maxLines: maxLines ?? 1,
              name: keyName,
              maxLength: maxLength,
              controller: controller,
              validator: validator,
              initialValue: initalValue,
              focusNode: focusNode,
              decoration: InputDecoration(
                  fillColor: readOnly ? Palette.greyBorder : Palette.white,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Palette.grey_9C9C9C),
                  ),
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
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Palette.red_FF0606,
                  ),
                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 17.w,
                      ),
                  hintText: hintText,
                  hintStyle: hintStyle,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon),
            ),
          ),
        ),
      ],
    );
  }
}
