import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class RecentUpdateCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String day;
  final String month;
  final String year;
  final Function onClick;

  const RecentUpdateCardItem({
    super.key,
    required this.title,
    required this.day,
    required this.month,
    required this.year,
    required this.onClick,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          end: 19.0.w, top: 5.0.h, bottom: 10.0.h, start: 5.w),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Palette.grey_7B7B7B.withOpacity(0.2),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 53.w,
                height: 65.h,
                decoration: BoxDecoration(
                  color: Palette.blue_002A6A,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    AppText(
                      text: day,
                      style: AppTextStyle.bold_22,
                      textColor: Palette.white,
                    ),
                    AppText(
                      text: month,
                      style: AppTextStyle.regular_13,
                      textColor: Palette.white,
                    ),
                    AppText(
                      text: year,
                      style: AppTextStyle.regular_12,
                      textColor: Palette.white,
                    ),
                  ],
                ),
              ),
              11.horizontalSpace,
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 210.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: title,
                      style: AppTextStyle.bold_16,
                    ),
                    5.verticalSpace,
                    AppText(
                      maxLines: 2,
                      text: subtitle,
                      style: AppTextStyle.regular_14,
                      textColor: Palette.grey_7B7B7B,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
