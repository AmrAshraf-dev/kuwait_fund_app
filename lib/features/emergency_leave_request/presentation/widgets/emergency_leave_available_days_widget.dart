import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_leave_request_cubit.dart';
 import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class EmergencyLeaveAvailableDaysWidget extends StatelessWidget {
  EmergencyLeaveAvailableDaysWidget({
    super.key,
  });

  final EmergencyLeaveRequestCubit    emergencyLeaveRequestCubit   = 
      getIt<EmergencyLeaveRequestCubit>();

      
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => emergencyLeaveRequestCubit,
      child:
          BlocBuilder<EmergencyLeaveRequestCubit, EmergencyLeaveScreenState>(
        builder: (context, state) {
          if (state is EmergencyLeaveScreenLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is EmergencyLeaveScreenErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
          } else if (state is EmergencyLeaveScreenReadyState) {
            ViewsToolbox.dismissLoading();
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          text: context.tr("available_emergency_leave_days"),
                        ),
                                                10.verticalSpace,

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                                      decoration: BoxDecoration(
                                        color: Palette.yellow_FBD823,
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AppText(
                                                text: state.response.data?.availableDays.toString(),
                                                style: AppTextStyle.bold_14),
                                          ),
                                        ),
                                      )),
    ),                        
                          
                         
                          
                      
                      ]),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
