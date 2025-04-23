import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/data/models/request/emergency_leave_request_request_model.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_remining_balance_cubit/emergency_remining_balance_cubit.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/widgets/emergency_leave_available_days_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class CreateEmergencyLeaveRequestScreen extends StatelessWidget {
  CreateEmergencyLeaveRequestScreen({super.key});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final EmergencyReminingLeaveBalanceCubit reminingLeaveBalanceCubit =
      getIt<EmergencyReminingLeaveBalanceCubit>();
  final EmergencyLeaveRequestCubit emergencyLeaveRequestCubit =
      getIt<EmergencyLeaveRequestCubit>();

   @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage2,
        screenTitle: context.tr("emergency_leave"),
        appBarHeight: 90.h,
        isBackEnabled: true,
        widget: MultiBlocProvider(
          providers: [
       
            BlocProvider<EmergencyReminingLeaveBalanceCubit>(
              create: (context) => reminingLeaveBalanceCubit,
            ),
            BlocProvider<EmergencyLeaveRequestCubit>(
              create: (context) => emergencyLeaveRequestCubit..getEmergencyLeaveScreen(),
            ),
            
          ],
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    44.verticalSpace,
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
                      child: FormBuilder(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 20.w),
                          child: Column(
                            children: [
                              CustomSingleRangeDatePicker(
                                labelTitle: context.tr("emergency_leave_days"),
                                consumedDays: 4,
                                totalDays: 4,
                                disableField: true,
                                initialDate: DateTime.now(),
                                keyNameFrom: "from",
                                customFormKey: _formKey,
                                fromLabelAboveField:
                                    context.tr("emergency_date"),
                              ),
                              20.verticalSpace,
                              BlocConsumer<EmergencyLeaveRequestCubit, EmergencyLeaveScreenState>(
                                listener: (context, state) {
                                    if (state is EmergencyLeaveScreenLoadingState) {
                                    ViewsToolbox.showLoading();
                                  }

                               else   if (state is EmergencyLeaveScreenErrorState) {
                                    ViewsToolbox.dismissLoading();
                                    ViewsToolbox.showErrorAwesomeSnackBar(
                                        context, state.message!);
                                  }
                                },
                                builder: (context, emergencyLeaveState) {
                                
                                 
                                      if (emergencyLeaveState
                                          is EmergencyLeaveScreenReadyState) {
                                         return Column(
                                    children: [
                                      CustomDropDownField<int>(
                                        keyName: "numberOfDays",
                                        labelText: context
                                            .tr("number_of_days_required"),
                                        disableSearch: true,
                                        disableFiled: false,
                                        labelAboveField: context
                                            .tr("number_of_days_required"),
                                        onChanged: (
                                          int? selectedDays,
                                        ) {
                                          reminingLeaveBalanceCubit
                                              .updateFormState(
                                                  showDetails: true,
                                                  selectedDays:
                                                    selectedDays!);
                                        },
                                        items: List<int>.generate(emergencyLeaveState.response.data?.allowedDays??0, (index) => index + 1) // Generate list dynamically
                                            .map((int item) {
                                          return DropdownMenuItem<int>(
                                            value: item,
                                            child: AppText(
                                              text: item.toString(),
                                              style: AppTextStyle.medium_18,
                                            ),
                                          );
                                        }).toList(),
                                        validator: (int? value) =>
                                            AppValidator.validatorRequired(
                                          value,
                                          context,
                                        ),
                                      ),
                                      15.verticalSpace,
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            color: Palette.orange_FF7904,
                                          ),
                                          5.horizontalSpace,
                                          Flexible(
                                            child: AppText(
                                              maxLines: 2,
                                              text:
                                                  "${context.tr("maximum_number_of_days_you_can_request")}: ",
                                              style: AppTextStyle.regular_13,
                                            ),
                                          ),
                                          2.horizontalSpace,
                                          AppText(
                                            text: emergencyLeaveState.response.data?.allowedDays .toString(),
                                            style: AppTextStyle.bold_14,
                                          ),
                                        ],
                                      ),

                                          20.verticalSpace,
                   
                           BlocBuilder<EmergencyReminingLeaveBalanceCubit,
                              EmergencyReminingLeaveBalanceState>(
                            builder: (context, state) {
                              if (state.showDetails) {
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
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        color: Palette.white_F7F7F7,
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                      ),
                                      child: LeaveDaysRowItemWidget(
                                        title: context.tr(
                                            "remaining_days_after_vacation"),
                                        days: calculateRemainingDays(
                                            emergencyLeaveState.response.data?.availableDays??0,
                                            state.selectedDays),
                                      ),
                                    ));
                              }
                              else {
                                return Container();
                              }
                            }),
                                    ],
                                  );
                                      }
                                         return Container();
                                    
                                }
                                
                              ),
                              15.verticalSpace,

                            ],
                          ),
                        ),
                      ),
                    ),
                

                            
                              
                           
                          
                        
                      
                    
                    30.verticalSpace,
                    EmergencyLeaveAvailableDaysWidget(
                      emergencyLeaveRequestCubit:emergencyLeaveRequestCubit
                    ),
                    26.verticalSpace,
                    InkWell(
                      onTap: () {
                        CustomMainRouter.push(MyAttendanceRoute());
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svg.calander.svg(
                              width: 25.w,
                              height: 25.h,
                              color: Palette.primaryColor),
                          13.horizontalSpace,
                          AppText(
                              text: context.tr(
                                "view_my_attandance",
                              ),
                              textColor: Palette.blue_5490EB,
                              style: AppTextStyle.medium_18),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    BlocConsumer<EmergencyLeaveRequestCubit,
                        EmergencyLeaveScreenState>(listener: (context, state) {
                      if (state is EmergencyLeaveRequestErrorState) {
                        ViewsToolbox.dismissLoading();

                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      }
                    }, builder: (context, state) {
                      if (state is EmergencyLeaveRequestReadyState) {
                        ViewsToolbox.dismissLoading();
                        CustomMainRouter.push(ThankYouRoute(
                          title: context.tr("request_submitted_successfully"),
                          subtitle: context.tr(
                              "your_emergency_leave_request_has_been_submitted_successfully"),
                        ));
                      } else if (state is EmergencyLeaveRequestLoadingState) {
                        ViewsToolbox.showLoading();
                      }
                      return CustomElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              emergencyLeaveRequestCubit.createEmergencyLeaveRequest(
                                  emergencyLeaveRequestModel:
                                      EmergencyLeaveRequestRequestModel(
                                          requestedDays:
                                              (reminingLeaveBalanceCubit.state)
                                                  .selectedDays));
                            }
                          },
                          text: context.tr("submit"));
                    }),
                  ])),
        ));
  }

  String calculateRemainingDays(int? leaveBalance, int? selectedDays) {
    if (leaveBalance != null && selectedDays != null) {
      return leaveBalance - selectedDays > 0
          ? (leaveBalance - selectedDays).toString()
          : "0";
    }
    return "0";
  }
}
