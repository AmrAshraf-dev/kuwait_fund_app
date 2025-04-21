import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String labelKey;

  const LegendItem({required this.color, required this.labelKey, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.h,
          width: 20.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
        ),
        10.horizontalSpace,
        AppText(
          text: context.tr(labelKey),
          style: AppTextStyle.medium_18,
        ),
      ],
    );
  }
}