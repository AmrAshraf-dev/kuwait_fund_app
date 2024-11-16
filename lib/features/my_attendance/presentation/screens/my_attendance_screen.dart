import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/widgets/attendance_log_item_widget.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/widgets/sick_leave_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class MyAttendanceScreen extends StatefulWidget {
  const MyAttendanceScreen({super.key});

  @override
  State<MyAttendanceScreen> createState() => _MyAttendanceScreenState();
}

class _MyAttendanceScreenState extends State<MyAttendanceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        appBarHeight: 300.h,
        screenTitle: context.tr("my_attendance"),
        waterMarkImage: waterMarkImage4,
        appBarBody: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SickLeaveChart(
                  height: 130.h,
                  width: 110.w,
                  timerString: "31:46",
                  color: Colors.blueAccent,
                  title: context.tr('available_leave_hours_untile_today'),
                ),
                SizedBox(
                  height: 100.h,
                  child: VerticalDivider(
                    color: Palette.blue_3B72C5,
                    thickness: 0.2,
                  ),
                ),
                SickLeaveChart(
                  height: 130.h,
                  width: 110.w,
                  timerString: "31:46",
                  color: Color(0xFFEDA18C),
                  title: context.tr('total_hours_of_leave_used'),
                ),
                SizedBox(
                  height: 100.h,
                  child: VerticalDivider(
                    color: Palette.blue_3B72C5,
                    thickness: 0.2,
                  ),
                ),
                SickLeaveChart(
                    height: 130.h,
                    width: 110.w,
                    timerString: "31:46",
                    title: context.tr('total_hours_of_delay'),
                    color: Palette.orange_FB5923),
              ],
            ),
            10.verticalSpace,
            AppText(
              textAlign: TextAlign.center,
              style: AppTextStyle.medium_16,
              textColor: Palette.white,
              text: context.tr(
                  "the_balance_that_will_be_transferred_to_the_emergency_balance"),
            )
          ],
        ),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTitleWidget(title: context.tr('attendance_logs')),
                  Container(
                    height: 42.h,
                    width: 42.h,
                    decoration: BoxDecoration(
                      color: Palette.yellow_FBD823,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Assets.svg.filterIcon.svg(),
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Column(
              children: [
                AttendanceLogCardItem(
                  date: "29-09-2021",
                  enterListTimes: ["08:00", "12:00", "08:00", "12:00"],
                  exitListTimes: ["12:00", "17:00", "12:00", "17:00"],
                ),
              ],
            ),
            AttendanceLogCardItem(
              date: "29-09-2021",
              enterListTimes: ["08:00", "12:00", "08:00", "12:00"],
              exitListTimes: ["12:00", "17:00", "12:00", "17:00"],
            ),
            AttendanceLogCardItem(
              date: "29-09-2021",
              enterListTimes: ["08:00", "12:00", "08:00", "12:00"],
              exitListTimes: ["12:00", "17:00", "12:00", "17:00"],
            ),
            20.verticalSpace,
          ],
        ));
  }
}
