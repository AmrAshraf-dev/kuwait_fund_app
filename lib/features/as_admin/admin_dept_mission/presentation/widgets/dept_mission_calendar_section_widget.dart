import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/calendar_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';

class DeptMissionCalendarSection extends StatelessWidget {
  const DeptMissionCalendarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarSectionWidget(
          customChildWidget: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Palette.white_F7F7F7,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        5.verticalSpace,
                        LeaveDaysRowItemWidget(
                          title: context.tr("emoloyees_on_leave_this_month"),
                          days: "4",
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        LeaveDaysRowItemWidget(
                          title: context.tr("number_of_missions_this_month"),
                          days: "4",
                        ),
                        5.verticalSpace,
                      ]),
                )),
          ),
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                height: 14.h,
                width: 14.h,
                decoration: BoxDecoration(
                  color: Palette.green_457403,
                  shape: BoxShape.rectangle,
                ),
              ),
              5.horizontalSpace,
              AppText(
                text: context.tr("mission"),
                style: AppTextStyle.medium_18,
              ),
            ]),
            Row(children: [
              Container(
                height: 14.h,
                width: 14.h,
                decoration: BoxDecoration(
                  color: Palette.orange_FFB162,
                  shape: BoxShape.rectangle,
                ),
              ),
              5.horizontalSpace,
              AppText(
                text: context.tr("leave"),
                style: AppTextStyle.medium_18,
              ),
            ]),
            Row(children: [
              Container(
                height: 14.h,
                width: 14.h,
                decoration: BoxDecoration(
                    color: Palette.orange_FFB162,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Palette.green_457403,
                      width: 2,
                    )),
              ),
              5.horizontalSpace,
              AppText(
                text: context.tr("mission_and_leave"),
                style: AppTextStyle.medium_18,
              ),
            ]),
          ],
        ),
        17.verticalSpace,
      ],
    );
  }
}
