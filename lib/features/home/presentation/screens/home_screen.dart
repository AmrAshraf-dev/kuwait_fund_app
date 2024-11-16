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
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/annual_leave_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/create_request_section_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/recent_update_section_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/slider_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage3,
        appBarHeight: 240.0.h,
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
                      child: SvgPicture.asset(
                        userCircleIcon,
                        color: Palette.white,
                        height: 50,
                      ),
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
                      onTap: () =>
                          CustomMainRouter.push(NotificationsRoute()),
                      child: Badge(
                        padding: EdgeInsets.all(1),
                        backgroundColor: Palette.red_FF0606,
                        label: AppText(
                          text: '3',
                          style: AppTextStyle.bold_12,
                          textColor: Colors.white,
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
                AnnualLeaveChart(
                  leaveUsed: 26,
                  totalLeave: 30,
                  color: Colors.blueAccent,
                  title: context.tr('annual_leave'),
                ),
                SizedBox(
                  height: 100.h,
                  child: VerticalDivider(
                    color: Palette.blue_3B72C5,
                    thickness: 0.2,
                  ),
                ),
                AnnualLeaveChart(
                  leaveUsed: 12,
                  totalLeave: 15,
                  color: Color(0xFFEDA18C),
                  title: context.tr('sick_leave'),
                ),
                SizedBox(
                  height: 100.h,
                  child: VerticalDivider(
                    color: Palette.blue_3B72C5,
                    thickness: 0.2,
                  ),
                ),
                AnnualLeaveChart(
                    leaveUsed: 2,
                    totalLeave: 4,
                    title: context.tr('vacations_used'),
                    color: Color(0xFFFBD823)),
              ],
            ),
          ],
        ),
        widget: Column(
          children: [
            20.verticalSpace,
            //create request section
            CreateRequestSection(),
            24.verticalSpace,
            SliderSection(),
            17.verticalSpace,
            RecentUpdatesSection(),
            60.verticalSpace,
          ],
        ));
  }
}
