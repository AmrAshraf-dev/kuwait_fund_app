import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class FundProfileItem extends StatelessWidget {
  const FundProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          color: Palette.blue_0C4192,
          child: Center(
            child: Assets.svg.male.svg(
              colorFilter: ColorFilter.mode(
                Palette.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        10.verticalSpace,
        AppText(
          text: 'Hesham El Nemr',
          style: AppTextStyle.medium_18,
        ),
        AppText(
          text: 'Software eng. flutter developer',
          style: AppTextStyle.regular_14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
