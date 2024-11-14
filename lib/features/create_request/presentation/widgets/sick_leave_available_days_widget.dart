import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class SickLeaveAvailableDaysWidget extends StatelessWidget {
  const SickLeaveAvailableDaysWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppText(
              text: context.tr("available_days"),
            ),
            10.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Palette.yellow_FBD823,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                AppText(text: "8", style: AppTextStyle.bold_14),
                          ),
                        )),
                    5.verticalSpace,
                    AppText(
                      text: context.tr("days"),
                      style: AppTextStyle.regular_16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Palette.yellow_FBD823,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                AppText(text: "8", style: AppTextStyle.bold_14),
                          ),
                        )),
                    5.verticalSpace,
                    AppText(
                      text: context.tr("hours"),
                      style: AppTextStyle.regular_16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Palette.yellow_FBD823,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                AppText(text: "8", style: AppTextStyle.bold_14),
                          ),
                        )),
                    5.verticalSpace,
                    AppText(
                      text: context.tr("minutes"),
                      style: AppTextStyle.regular_16,
                    ),
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}
