import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/annual_leave_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/timeline_card_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class AnnualLeaveRequestDetailsScreen extends StatelessWidget {
  const AnnualLeaveRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage4,
        appBarHeight: 340.h,
        isBackEnabled: true,
        screenTitle: context.tr("annual_leave_request"),
        appBarBody: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // app text date
                AppText(
                  text: "01/01/2021",
                  style: AppTextStyle.semiBold_12,
                  textColor: Palette.white,
                ),
                Assets.svg.calander.svg(width: 28.w, height: 28.h),
              ],
            ),
            10.verticalSpace,
            AppText(
              text: context.tr("applied_for"),
              style: AppTextStyle.semiBold_16,
              textColor: Palette.white,
            ),
            10.verticalSpace,
            IntrinsicHeight(
              child: AnnualLeaveChart(
                leaveUsed: 26,
                totalLeave: 30,
                height: 80.h,
                width: 120.w,
                color: Colors.blueAccent,
                title: "${context.tr('from')} 01/01/2021 ",
                subTitle: "${context.tr('to')} 01/01/2022",
              ),
            ),
            10.verticalSpace,
            Container(
              decoration: BoxDecoration(
                color: Palette.green_07BF0D,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(
                  text: context.tr("approved"),
                  style: AppTextStyle.semiBold_16,
                  textColor: Palette.white,
                ),
              ),
            ),
          ],
        ),
        widget: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
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
                            title: context.tr("paid_days"),
                            days: "4",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          LeaveDaysRowItemWidget(
                            title: context.tr("remaining_days_after_vacation"),
                            days: "4",
                          ),
                          5.verticalSpace,
                        ]),
                  )),
              20.verticalSpace,
              MainTitleWidget(
                title: context.tr("track_request"),
              ),
              ApprovalTimeline(),
            ])));
  }
}

class ApprovalTimeline extends StatelessWidget {
  const ApprovalTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        TimeLineCard(
          name: "Ahmed Al-Rashid",
          position: "Supervisor",
          status: "Approved",
          date: "22/Oct/2024",
          isFirst: true,
          isLast: false,
        ),
        TimeLineCard(
          name: "Ahmed Al-Rashid",
          position: "Supervisor",
          status: "Approved",
          date: "22/Oct/2024",
          isFirst: false,
          isLast: true,
        ),
      ],
    );
  }
}
