import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/half_circle_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/recent_update_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/calendar_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage3,
        appBarHeight: 240.0.h,
                isBackEnabled: false,

        appBarBody: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // profile photo image widget
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Palette.blue_5490EB,
                          width: 2.0,
                        ),
                      ),
                      child: Assets.svg.userCircleIcon
                          .svg(width: 50.w, height: 50.w, color: Palette.white),
                    ),
                    12.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text:
                              "${context.tr('hi')} ${context.tr('good_morning')}",
                          style: AppTextStyle.regular_16,
                          textColor: Colors.white,
                        ),
                        5.verticalSpace,
                        SizedBox(
                          width: 150.w,
                          child: AppText(
                            text: 'Ahmed Mohamed',
                            style: AppTextStyle.bold_16,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(chatbot),
                        )),
                    17.horizontalSpace,
                    InkWell(
                      onTap: () => CustomMainRouter.push(NotificationsRoute()),
                      child: Badge(
                        padding: EdgeInsets.all(1),
                        backgroundColor: Palette.red_FF0606,
                        label: SizedBox(
                          height: 15.h,
                          width: 15.w,
                          child: Center(
                            child: AppText(
                              text: '3',
                              style: AppTextStyle.bold_12,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                        child: Container(
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SvgPicture.asset(notification),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HalfCircleChartWidget(
                  leaveUsed: 26,
                  totalLeave: 30,
                  color: Colors.blueAccent,
                  title: context.tr('managers_on_mission'),
                ),
                SizedBox(
                  height: 100.h,
                  child: VerticalDivider(
                    color: Palette.blue_3B72C5,
                    thickness: 0.2,
                  ),
                ),
                HalfCircleChartWidget(
                  leaveUsed: 12,
                  totalLeave: 15,
                  color: Color(0xFFEDA18C),
                  title: context.tr('managers_on_leave'),
                ),
                SizedBox(
                  height: 100.h,
                  child: VerticalDivider(
                    color: Palette.blue_3B72C5,
                    thickness: 0.2,
                  ),
                ),
                HalfCircleChartWidget(
                    leaveUsed: 2,
                    totalLeave: 4,
                    title: context.tr('department_on_mission'),
                    color: Color(0xFFFBD823)),
              ],
            ),
          ],
        ),
        widget: Column(
          children: [
            20.verticalSpace,
            AppText(
              text: context.tr("mission/leave_calendar"),
              style: AppTextStyle.bold_21,
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CalendarSectionWidget(
                customChildWidget: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Palette.white_F7F7F7,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.verticalSpace,
                              LeaveDaysRowItemWidget(
                                title:
                                    context.tr("emoloyees_on_leave_this_month"),
                                days: "4",
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                              LeaveDaysRowItemWidget(
                                title:
                                    context.tr("number_of_missions_this_month"),
                                days: "4",
                              ),
                              5.verticalSpace,
                            ]),
                      )),
                ),
              ),
            ),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
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
                    10.horizontalSpace,
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
                    10.horizontalSpace,
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
                    10.horizontalSpace,
                    AppText(
                      text: context.tr("mission_and_leave"),
                      style: AppTextStyle.medium_18,
                    ),
                  ]),
                ],
              ),
            ),
            17.verticalSpace,
            RecentUpdatesSection(),
            60.verticalSpace,
          ],
        ));
  }
}
