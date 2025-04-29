import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class AttendanceLogCardItem extends StatelessWidget {
  final String date;
  final List<String> enterListTimes;
  final List<String> exitListTimes;

  const AttendanceLogCardItem({
    super.key,
    required this.date,
    required this.enterListTimes,
    required this.exitListTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: date,
                style: AppTextStyle.semiBold_16,
                textColor: Palette.black,
              ),
              5.verticalSpace,
              Divider(
                thickness: 1,
              ),
              5.verticalSpace,
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.login,
                              color: Palette.green,
                              size: 20.sp,
                            ),
                            5.horizontalSpace,
                            AppText(
                              text: context.tr("in"),
                              style: AppTextStyle.bold_16,
                              textColor: Palette.green,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 15.0),
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.logout,
                                color: Palette.red_FF0606,
                                size: 20.sp,
                              ),
                            ),
                            5.horizontalSpace,
                            AppText(
                              text: context.tr("out"),
                              style: AppTextStyle.bold_16,
                              textColor: Palette.red_FF0606,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  ...List.generate(
                    enterListTimes.length,
                    (index) {
                      final isOdd = index % 2 == 0;
                      return Container(
                        width: double.infinity,
                        color: isOdd ? Palette.gray_F3F3F3 : Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: enterListTimes[index],
                              style: AppTextStyle.medium_16,
                              textColor: Palette.black,
                            ),
                            AppText(
                              text: exitListTimes.length > index
                                  ? exitListTimes[index]
                                  : '',
                              style: AppTextStyle.medium_16,
                              textColor: Palette.black,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
