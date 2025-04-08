import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/data/models/request/annual_leave_request_request_model.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/cubits/annual_leave_balance_cubit/annual_leave_balance_cubit.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/cubits/annual_leave_remining_balance_cubit/annual_leave_remining_balance_cubit.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/cubits/annual_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/custom_date_picker_range.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class CreateAnnualLeaveRequestScreen extends StatelessWidget {
  CreateAnnualLeaveRequestScreen({super.key});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final AnnualLeaveRequestCubit annualLeaveRequestCubit =
      getIt<AnnualLeaveRequestCubit>();
  final AnnualLeaveBalanceCubit leaveBalanceCubit =
      getIt<AnnualLeaveBalanceCubit>();
  final AnnualLeaveReminingLeaveBalanceCubit reminingLeaveBalanceCubit =
      getIt<AnnualLeaveReminingLeaveBalanceCubit>();
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage2,
        screenTitle: context.tr("annual_leave"),
        appBarHeight: 90.h,
        isBackEnabled: true,
        widget: MultiBlocProvider(
          providers: [
            BlocProvider<AnnualLeaveRequestCubit>(
              create: (context) => annualLeaveRequestCubit,
            ),
            BlocProvider<AnnualLeaveReminingLeaveBalanceCubit>(
              create: (context) => reminingLeaveBalanceCubit,
            ),
            BlocProvider<AnnualLeaveBalanceCubit>(
              create: (context) => leaveBalanceCubit..getAnnualLeaveBalance(),
            ),
          ],
          child: BlocConsumer<AnnualLeaveBalanceCubit, LeaveBalanceState>(
            listener: (context, state) {
              if(state is LeaveBalanceErrorState){
           
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showErrorAwesomeSnackBar(
                    context, state.message!);
              
             }
          
            },
            builder: (context, leaveBalanceState) {
              if (leaveBalanceState is LeaveBalanceReadyState) {
                ViewsToolbox.dismissLoading();
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
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
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: CustomDatePickerRange(
                                  labelTitle: context.tr("annual_leave_days"),
                                  consumedDays: 0,
                                  totalDays: int.parse(
                                      leaveBalanceState.response.data ?? "0"),
                                  keyNameFrom: "from",
                                  keyNameTo: "to",
                                  customFormKey: _formKey,
                                  fromLabelAboveField: context.tr("from_date"),
                                  toLabelAboveField: context.tr("to_date"),
                                  onDoneCallback: (bool isSelectedRangeValid) {
                                    Navigator.of(context).pop();
                                    reminingLeaveBalanceCubit.updateFormState(
                                        showDetails: isSelectedRangeValid);
                                  },
                                ),
                              ),
                            ),
                          ),
                          //date selector from and two
                          20.verticalSpace,
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
                            child: BlocBuilder<
                                    AnnualLeaveReminingLeaveBalanceCubit,
                                    AnnualLeaveReminingLeaveBalanceState>(
                                builder: (context, state) {
                              if (state.showDetails) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      5.verticalSpace,
                                      LeaveDaysRowItemWidget(
                                        title: context.tr("paid_days"),
                                        days: _calculatePaidDays(
                                                from: _formKey.currentState!
                                                    .fields["from"]!.value,
                                                to: _formKey.currentState!
                                                    .fields["to"]!.value)
                                            .toString(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25.w),
                                        child: Divider(
                                          thickness: 1,
                                        ),
                                      ),
                                      LeaveDaysRowItemWidget(
                                        title: context.tr(
                                            "remaining_days_after_vacation"),
                                        days: _calculateRemainingDays(
                                            leaveBalance: int.parse(
                                                leaveBalanceState
                                                        .response.data ??
                                                    "0"),
                                            from: _formKey.currentState!
                                                .fields["from"]!.value,
                                            to: _formKey.currentState!
                                                .fields["to"]!.value),
                                      ),
                                      5.verticalSpace,
                                    ]);
                              } else {
                                return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      color: Palette.white_F7F7F7,
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: LeaveDaysRowItemWidget(
                                      title: context.tr("available_days"),
                                      days:
                                          leaveBalanceState.response.data ?? "",
                                    ));
                              }
                            }),
                          ),

                          120.verticalSpace,
                          BlocConsumer<AnnualLeaveRequestCubit,
                              AnnualLeaveRequestState>(

                            listener: (context, state) {
                              if (state
                                  is AnnualLeaveRequestErrorState) {
                                ViewsToolbox.dismissLoading();

                                ViewsToolbox.showErrorAwesomeSnackBar(
                                    context, state.message!);
                              }
                            },
                            builder: (context, state) {
                              if (state is AnnualLeaveRequestReadyState) {
                                ViewsToolbox.dismissLoading();
                                CustomMainRouter.push(ThankYouRoute(
                                  title: context
                                      .tr("request_submitted_successfully"),
                                  subtitle: context.tr(
                                      "your_annual_leave_request_has_been_submitted_successfully"),
                                ));
                              } else if (state
                                  is AnnualLeaveRequestLoadingState) {
                                ViewsToolbox.showLoading();
                              }  
                              return CustomElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!
                                        .saveAndValidate()) {
                                      annualLeaveRequestCubit
                                          .createAnnualLeaveRequest(
                                              AnnualLeaveRequestRequestModel(
                                        leaveType: 0,
                                        startDate: _formKey.currentState!
                                            .fields["from"]!.value,
                                        endDate: _formKey
                                            .currentState!.fields["to"]!.value,
                                            exitDate: null
                                        // exitDate: _formKey
                                        //     .currentState!.fields["to"]!.value,
                                      ));
                                    }
                                  },
                                  text: context.tr("submit"));
                            },
                          ),
                        ]));
              } else if (leaveBalanceState is LeaveBalanceLoadingState) {
                ViewsToolbox.showLoading();
              } 
              return Container();
            },
          ),
        ));
  }

  String _calculateRemainingDays(
      {required int leaveBalance, required String from, required String to}) {
    return leaveBalance - _calculatePaidDays(from: from, to: to) < 0
        ? "0"
        : (leaveBalance - _calculatePaidDays(from: from, to: to)).toString();
  }

  num _calculatePaidDays({required String from, required String to}) {
    final DateTime fromDate = DateTime.parse(from);
    final DateTime toDate = DateTime.parse(to);
    return toDate.difference(fromDate).inDays;
  }
}

// class ApprovalTimeline extends StatelessWidget {
//   const ApprovalTimeline({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         10.verticalSpace,
//         TimeLineCard(
//           name: "Ahmed Al-Rashid",
//           position: "Supervisor",
//           status: "Approved",
//           date: "22/Oct/2024",
//           isFirst: true,
//           isLast: false,
//         ),
//         TimeLineCard(
//           name: "Ahmed Al-Rashid",
//           position: "Supervisor",
//           status: "Approved",
//           date: "22/Oct/2024",
//           isFirst: false,
//           isLast: true,
//         ),
//       ],
//     );
//   }
// }
