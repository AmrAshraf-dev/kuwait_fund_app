import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/domain/entities/my_attendance_entity.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/cubits/my_attendance_cubit.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/widgets/attendance_log_item_widget.dart';
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/widgets/sick_leave_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
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
  final MyAttendanceCubit myAttendanceCubit = getIt<MyAttendanceCubit>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => myAttendanceCubit,
      child: BlocConsumer<MyAttendanceCubit, MyAttendanceState>(
        listener: (context, state) {
          if (state is MyAttendanceLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is MyAttendanceErrorState) {
            ViewsToolbox.dismissLoading();
ViewsToolbox.showMessageBottomsheet(
                    actionsData: 

                    CustomElevatedButton(
                        width: 300.w,
                        text: context.tr("continue"),
                        onPressed: () {
                       CustomMainRouter.back();  
                        }),

                     
                    
                    context: context,
                    status: ConfirmationPopupStatus.failure,
                    message: tr("noDataFound"),
                  );
          } else if (state is MyAttendanceReadyState) {
            ViewsToolbox.dismissLoading();
          }
        },
        builder: (context, state) {
        
            final MyAttendanceEntity? attendance =state is MyAttendanceReadyState ? state.response.data!:null;
            return MasterWidget(
                      isBackEnabled: true,

                appBarHeight: 310.h,
                screenTitle: context.tr("my_attendance"),
                waterMarkImage: waterMarkImage4,
                appBarBody: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SickLeaveChart(
                          height: 140.h,
                          width: 110.w,
                          timerString: attendance?.availableHours ?? "0:00",
                          color: Colors.blueAccent,
                          title:
                              context.tr('available_leave_hours_untile_today'),
                        ),
                        SizedBox(
                          height: 130.h,
                          child: VerticalDivider(
                            color: Palette.blue_3B72C5,
                            thickness: 0.2,
                          ),
                        ),
                        SickLeaveChart(
                          height: 130.h,
                          width: 110.w,
                          timerString: attendance?.usedHours ?? "0:00",
                          color: Color(0xFFEDA18C),
                          title: context.tr('total_hours_of_leave_used'),
                        ),
                        SizedBox(
                          height: 130.h,
                          child: VerticalDivider(
                            color: Palette.blue_3B72C5,
                            thickness: 0.2,
                          ),
                        ),
                        SickLeaveChart(
                            height: 130.h,
                            width: 110.w,
                            timerString: attendance?.delayHours ?? "0:00",
                            title: context.tr('total_hours_of_delay'),
                            color: Palette.orange_FB5923),
                      ],
                    ),
                    10.verticalSpace,
                    AppText(
                      maxLines: 2,
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
                            MainTitleWidget(
                                title: context.tr('attendance_logs')),
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
                      if(attendance?.attendanceData!=null)
                      Column(
                        children: attendance!.attendanceData
                            .map((e) => AttendanceLogCardItem(
                                  date: e.attendanceDate ?? "",
                                  enterListTimes: e.inOutInfo
                                      .map((e) => e.inTime ?? "")
                                      .toList(),
                                  exitListTimes: e.inOutInfo
                                      .map((e) => e.outTime ?? "")
                                      .toList(),
                                ))
                            .toList(),
                      )
                    ]));
          }
        
        
      ),
    );
  }
}
