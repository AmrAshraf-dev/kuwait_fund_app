import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';

class EditButton extends StatefulWidget {
  const EditButton({super.key , required this.onPressed});
  final void Function() onPressed;

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 24.h,
      backgroundColor: Palette.yellow_FBD823,
      text: context.tr("edit"),
      textStyle: AppTextStyle.regular_14,
      removeWidth: true,
      radius: 16.r,
      textColor: Palette.black,
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
