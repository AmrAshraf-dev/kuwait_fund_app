import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/half_circle_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/delete_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_info_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/annual_leave_details_history_cubit/annual_leave_details_history_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/annual_leave_info_cubit/annual_leave_info_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/delete_leave_cubit/delete_leave_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/extend_leave_cubit/extend_leave_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/leave_history_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/advanced_expandable_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class AnnualLeaveRequestDetailsScreen extends StatefulWidget {
  String? requestID;
  AnnualLeaveRequestDetailsScreen({super.key, this.requestID});

  @override
  State<AnnualLeaveRequestDetailsScreen> createState() =>
      _AnnualLeaveRequestDetailsScreenState();
}

class _AnnualLeaveRequestDetailsScreenState
    extends State<AnnualLeaveRequestDetailsScreen> {
  List<AnnualLeaveDetailsEntity>? annualLeaveDetailsEntityResponse;
  AnnualLeaveInfoEntity? annualLeaveInfoEntityResponse;
  final AnnualLeaveDetailsHistoryCubit annualLeaveDetailsHistoryCubit =
      getIt<AnnualLeaveDetailsHistoryCubit>();
  final AnnualLeaveInfoCubit annualLeaveInfoCubit =
      getIt<AnnualLeaveInfoCubit>();
  final ExtendLeaveCubit extendLeaveCubit = getIt<ExtendLeaveCubit>();
  final DeleteLeaveCubit deleteLeaveCubit = getIt<DeleteLeaveCubit>();

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
  }

  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Disable past dates
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Palette.primaryColor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      debugPrint("Selected Date: ${_dateController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    String leaveUsed = //annualLeaveInfoEntityResponse?.leavDaysTaken ??
        '26';
    int leaveDaysTaken = int.parse(leaveUsed);
    String totalLeave =
        //annualLeaveInfoEntityResponse?.leaveRequestsCount ??
        '30';
    int leaveRequestsCount = int.parse(totalLeave);

    return MasterWidget(
        waterMarkImage: waterMarkImage4,
        appBarHeight: 355.h,
        isBackEnabled: true,
        screenTitle: context.tr("annual_leave_request"),
        appBarBody: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => annualLeaveInfoCubit
                ..getAnnualLeaveInfo(
                  annualLeaveInfoRequestModel: AnnualLeaveInfoRequestModel(
                      leaveRequestID: widget.requestID),
                ),
            ),
          ],
          child: GestureDetector(
              onTap: () async {
                // ViewsToolbox.showBottomSheet(
                //   height: 1.sh - 200,
                //   context: context,
                //   widget:
                // RangeDatePickerBottomsheetWidget(
                //     isReadOnly: true,
                //     // selectedRange:

                //     // DateTimeRange(
                //     //   start: startDate, //DateTime.now(),
                //     //   end:
                //     //       endDate, //DateTime.now().add(const Duration(days: 7)),
                //     // ),
                //     selectedRange: startDate != null && endDate != null
                //         ? DateTimeRange(start: startDate!, end: endDate!)
                //         : null,
                //     onDoneCallback: (bool isSelectedRangeValid,
                //         DateTimeRange? pickedRange) {
                //       if (isSelectedRangeValid && pickedRange != null) {
                //         setState(() {
                //           startDate = pickedRange.start;
                //           endDate = pickedRange.end;
                //         });
                //       }
                //       print(
                //           'Start out: ${DateFormat('dd MMM, yyyy').format(startDate! //?? DateTime.now()
                //               )}');
                //       print(
                //           'End out: ${DateFormat('dd MMM, yyyy').format(endDate! // ??
                //               // DateTime.now().add(
                //               //   const Duration(days: 10),
                //               // ),
                //               )}');
                //       Navigator.pop(context);
                //     },
                //     //consumedDays: 26,
                //     // totalDays: 30
                //   ),
                // );
                DateTimeRange? picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                if (picked != null) {
                  setState(() {
                    startDate = picked.start;
                    endDate = picked.end;
                  });

                  // Print selected dates
                  // print(
                  //     'Start date: ${DateFormat('dd/MM/yyyy').format(startDate!)}');
                  // print('End date: ${DateFormat('dd/MM/yyyy').format(endDate!)}');

                  Navigator.pop(context); // Close the bottom sheet
                }
              },
              child: BlocConsumer<AnnualLeaveInfoCubit, AnnualLeaveInfoState>(
                  listener: (context, state) {
                if (state is AnnualLeaveInfoErrorState) {
                  ViewsToolbox.dismissLoading();
                  ViewsToolbox.showErrorAwesomeSnackBar(
                      context, state.message ?? '');
                }
              }, builder: (context, state) {
                if (state is AnnualLeaveInfoLoadingState) {
                  ViewsToolbox.showLoading();
                } else if (state is AnnualLeaveInfoReadyState) {
                  annualLeaveInfoEntityResponse = state.response.data;

                  ViewsToolbox.dismissLoading();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // app text date
                          AppText(
                            text: annualLeaveInfoEntityResponse?.requestDate !=
                                    null
                                ? DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(annualLeaveInfoEntityResponse
                                            ?.requestDate ??
                                        ''))
                                : '',
                            style: AppTextStyle.semiBold_12,
                            textColor: Palette.white,
                          ),
                          //    Assets.svg.calander.svg(width: 28.w, height: 28.h),
                        ],
                      ),
                      10.verticalSpace,
                      AppText(
                        text: context.tr("applied_for"),
                        style: AppTextStyle.semiBold_16,
                        textColor: Palette.white,
                      ),
                      10.verticalSpace,
                      HalfCircleChartWidget(
                        leaveUsed: leaveDaysTaken,
                        totalLeave: leaveRequestsCount,
                        height: 80.h,
                        width: 120.w,
                        color: Colors.blueAccent,
                        title:
                            "${context.tr('from')} ${annualLeaveInfoEntityResponse?.leaveStartDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(annualLeaveInfoEntityResponse?.leaveStartDate ?? '')) : ''}",
                        subTitle:
                            "${context.tr('to')} ${annualLeaveInfoEntityResponse?.leaveEndDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(annualLeaveInfoEntityResponse?.leaveEndDate ?? '')) : ''}",
                      ),
                      10.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          color: Palette.orangeBackgroundTheme,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: context.tr("pending"),
                            style: AppTextStyle.semiBold_16,
                            textColor: Palette.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              })),
        ),
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => annualLeaveDetailsHistoryCubit
                ..getAnnualLeaveDetailsHistory(
                  annualLeaveDetailsRequestModel:
                      AnnualLeaveDetailsRequestModel(
                          startDate: DateFormat('yyyy-MM-dd')
                              .format(startDate ?? DateTime.now()),
                          endDate: DateFormat('yyyy-MM-dd')
                              .format(startDate ?? DateTime.now())),
                ),
            ),
            BlocProvider(
              create: (context) => annualLeaveInfoCubit
                ..getAnnualLeaveInfo(
                  annualLeaveInfoRequestModel: AnnualLeaveInfoRequestModel(
                      leaveRequestID: widget.requestID ?? ''),
                ),
            ),
            BlocProvider(create: (context) => extendLeaveCubit),
            BlocProvider(create: (context) => deleteLeaveCubit),
            //
          ],
          child: BlocConsumer<AnnualLeaveInfoCubit, AnnualLeaveInfoState>(
              listener: (context, state) {
            if (state is AnnualLeaveInfoErrorState) {
              ViewsToolbox.dismissLoading();
              ViewsToolbox.showErrorAwesomeSnackBar(
                  context, state.message ?? '');
            }
          }, builder: (context, state) {
            if (state is AnnualLeaveInfoLoadingState) {
              ViewsToolbox.showLoading();
            } else if (state is AnnualLeaveInfoReadyState) {
              annualLeaveInfoEntityResponse = state.response.data;
              ViewsToolbox.dismissLoading();
              return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(25.r),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.grey.withOpacity(0.5),
                        //           spreadRadius: 5,
                        //           blurRadius: 7,
                        //           offset: Offset(0, 3),
                        //         ),
                        //       ],
                        //     ),
                        //     child: Container(
                        //       margin: EdgeInsets.symmetric(
                        //           vertical: 10.h, horizontal: 10.w),
                        //       decoration: BoxDecoration(
                        //         color: Palette.white_F7F7F7,
                        //         borderRadius: BorderRadius.circular(25.r),
                        //       ),
                        //       child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             5.verticalSpace,
                        //             LeaveDaysRowItemWidget(
                        //               title: context.tr("paid_days"),
                        //               days: annualLeaveInfoEntityResponse
                        //                       ?.shortSickDays ??
                        //                   '4',
                        //             ),
                        //             Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal: 25.w),
                        //               child: Divider(
                        //                 thickness: 1,
                        //               ),
                        //             ),
                        //             LeaveDaysRowItemWidget(
                        //               title: context
                        //                   .tr("remaining_days_after_vacation"),
                        //               days: annualLeaveInfoEntityResponse
                        //                       ?.tolalExecese ??
                        //                   '4',
                        //             ),
                        //             5.verticalSpace,
                        //           ]),
                        //     ),
                        //     ),
                        // 20.verticalSpace,
                        // MainTitleWidget(
                        //   title: context.tr("track_request"),
                        // ),
                        // ApprovalTimeline(),

//? AnnualLeaveDetailsHistory
                        // BlocConsumer<AnnualLeaveDetailsHistoryCubit,
                        //     AnnualLeaveDetailsHistoryState>(
                        //   listener: (context, state) {
                        //     if (state is AnnualLeaveDetailsHistoryErrorState) {
                        //       ViewsToolbox.dismissLoading();
                        //       ViewsToolbox.showErrorAwesomeSnackBar(
                        //           context, state.message ?? '');
                        //     }
                        //   },
                        //   builder: (context, state) {
                        //     if (state
                        //         is AnnualLeaveDetailsHistoryLoadingState) {
                        //       ViewsToolbox.showLoading();
                        //     } else if (state
                        //         is AnnualLeaveDetailsHistoryReadyState) {
                        //       annualLeaveDetailsEntityResponse =
                        //           state.response.data ?? [];
                        //       ViewsToolbox.dismissLoading();
                        //       return AdvancedExpandableSection(
                        //           headerPadding:
                        //               const EdgeInsetsDirectional.only(
                        //                   start: 20, top: 20, bottom: 20),
                        //           customText: SizedBox(
                        //               width: 240.w,
                        //               child: MainTitleWidget(
                        //                   title: context.tr("leave_history"))),
                        //           children: annualLeaveDetailsEntityResponse!
                        //               .map((AnnualLeaveDetailsEntity
                        //                   annualLeaveDetailsEntity) {
                        //             return LeaveHistoryItemWidget(
                        //               annualLeaveDetailsEntity:
                        //                   annualLeaveDetailsEntity,
                        //             );
                        //           }).toList());
                        //     }
                        //     // print(
                        //     //     'RESPONSE : ${annualLeaveDetailsEntityResponse?.first.leaveStatus ?? 'null1'}');
                        //     return Container();
                        //   },
                        // ),
                        //10.verticalSpace,

                        // annualLeaveInfoEntityResponse?.showCancelButton ==
                        //             true &&
                        //         annualLeaveInfoEntityResponse
                        //                 ?.showExtendButton ==
                        //             true
                        //     ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //accept
                            // BlocConsumer<ExtendLeaveCubit, ExtendLeaveState>(
                            //   listener: (context, state) {
                            //     if (state is ExtendLeaveErrorState) {
                            //       ViewsToolbox.dismissLoading();
                            //       ViewsToolbox.showMessageBottomsheet(
                            //           context: context,
                            //           message: context.tr('error'),
                            //           status: ConfirmationPopupStatus.failure);
                            //     }
                            //   },
                            //   builder: (context, state) {
                            //     if (state is ExtendLeaveLoadingState) {
                            //       ViewsToolbox.showLoading();
                            //     } else if (state is ExtendLeaveReadyState) {
                            //       ViewsToolbox.dismissLoading();
                            //       ViewsToolbox.showMessageBottomsheet(
                            //           context: context,
                            //           message: context
                            //               .tr('leave_extended_successfully'),
                            //           status: ConfirmationPopupStatus.success);
                            //       return CustomElevatedButton(
                            //         text: context.tr('extend'), //extend
                            //         backgroundColor:
                            //             Palette.greenBackgroundTheme,
                            //         width: 150.w,
                            //         height: 50.h,
                            //         onPressed: () async {
                            //           DateTimeRange? picked =
                            //               await showDateRangePicker(
                            //             context: context,
                            //             firstDate: DateTime(2020),
                            //             lastDate: DateTime(2030),
                            //           );

                            //           if (picked != null) {
                            //             extendLeaveCubit.getExtendLeave(
                            //                 extendLeaveRequestModel:
                            //                     ExtendLeaveRequestModel(
                            //               leaveRequestId:
                            //                   widget.requestID ?? '',
                            //               extendDate: picked.end.toString(),
                            //             ));

                            //             // Print selected dates
                            //             // print(
                            //             //     'Start date: ${DateFormat('dd/MM/yyyy').format(startDate!)}');
                            //             // print('End date: ${DateFormat('dd/MM/yyyy').format(endDate!)}');

                            //             // Navigator.pop(
                            //             //     context);
                            //             // Close the bottom sheet
                            //           }
                            //         },
                            //       );
                            //     }
                            //     return
                            //         AppText(
                            //           text: 'Empty',
                            //         );

                            //   },
                            // ),
                            //choose from calendar from and to date
                            //
                            //reject
                            // BlocConsumer<DeleteLeaveCubit, DeleteLeaveState>(
                            //     listener: (context, state) {
                            //   if (state is ExtendLeaveErrorState) {
                            //     ViewsToolbox.dismissLoading();
                            //     ViewsToolbox.showMessageBottomsheet(
                            //         context: context,
                            //         message: context.tr('error'),
                            //         status: ConfirmationPopupStatus.failure);
                            //   }
                            // }, builder: (context, state) {
                            //   if (state is DeleteLeaveLoadingState) {
                            //     ViewsToolbox.showLoading();
                            //   } else if (state is DeleteLeaveReadyState) {
                            //     ViewsToolbox.dismissLoading();
                            //     return CustomElevatedButton(
                            //       text: context.tr('delete'), //delete
                            //       backgroundColor: Palette.redBackgroundTheme,
                            //       width: 150.w,
                            //       height: 50.h,
                            //       onPressed: () {
                            //         deleteLeaveCubit.getDeleteLeave(
                            //             deleteLeaveRequestModel:
                            //                 DeleteLeaveRequestModel(
                            //           leaveRequestID: widget.requestID ?? '',
                            //         ));
                            //       },
                            //     );
                            //   }
                            //   return AppText(
                            //     text: 'Empty',
                            //   );
                            // }),
                            //new viewToolBox
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Palette.white,
                            boxShadow: [
                              BoxShadow(
                                color: Palette.grey_9C9C9C,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: annualLeaveInfoEntityResponse
                                                    ?.requestDate !=
                                                null
                                            ? DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(
                                                    annualLeaveInfoEntityResponse
                                                            ?.requestDate ??
                                                        ''))
                                            : '',
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Palette.orangeBackgroundTheme,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AppText(
                                            text: context.tr("pending"),
                                            style: AppTextStyle.semiBold_16,
                                            textColor: Palette.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                //
                                //
                                //

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          AppText(
                                              style: AppTextStyle.bold_18,
                                              text: context.tr('leaveStatus')),
                                          AppText(
                                              text:
                                                  annualLeaveInfoEntityResponse
                                                          ?.leaveStatus ??
                                                      ''),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                              style: AppTextStyle.bold_18,
                                              text: context.tr('leaveType')),
                                          AppText(
                                              text:
                                                  annualLeaveInfoEntityResponse
                                                          ?.leaveType ??
                                                      ''),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          AppText(
                                              style: AppTextStyle.bold_18,
                                              text: context.tr('from_date')),
                                          AppText(
                                            text: annualLeaveInfoEntityResponse
                                                        ?.leaveStartDate !=
                                                    null
                                                ? DateFormat('yyyy-MM-dd')
                                                    .format(DateTime.parse(
                                                        annualLeaveInfoEntityResponse
                                                                ?.leaveStartDate ??
                                                            ''))
                                                : '',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                              style: AppTextStyle.bold_18,
                                              text: context.tr('to_date')),
                                          AppText(
                                            text: annualLeaveInfoEntityResponse
                                                        ?.leaveEndDate !=
                                                    null
                                                ? DateFormat('yyyy-MM-dd')
                                                    .format(DateTime.parse(
                                                        annualLeaveInfoEntityResponse
                                                                ?.leaveEndDate ??
                                                            ''))
                                                : '',
                                          ),
                                          if (_selectedDate != null)
                                            AppText(
                                              style: AppTextStyle.bold_15,
                                              text:
                                                  '${context.tr('selectedDate')}: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                                            )
                                        ],
                                      ),
                                      CustomElevatedButton(
                                        onPressed: () {
                                          _selectDate(context);
                                        },
                                        text: context.tr("extend"),
                                        width: 100.w,
                                        height: 40.h,
                                        backgroundColor:
                                            Palette.greenBackgroundTheme,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        12.verticalSpace,
                        Center(
                          child: CustomElevatedButton(
                            onPressed: () async {
                              final result = await showConfirmationDialog(
                                  context: context,
                                  title: context.tr('extend'),
                                  content: context.tr('extendDialog'),
                                  yesText: context.tr('submit'),
                                  noText: context.tr('cancel'),
                                  yesColor: Palette.primaryColor,
                                  noColor: Palette.red_FF0606);
                              if (result ?? false) {
                                // User confirmed
                              }
                            },
                            text: context.tr("submit"),
                            width: 300.w,
                            height: 50.h,
                            backgroundColor: Palette.primaryColor,
                          ),
                        ),
                      ]));
            }
            return Container();
          }),
        ));
  }

  _getRequestStatusColor(String requestStatus) {
    switch (requestStatus) {
      case "Pending" || "قيد الانتظار":
        return Palette.orangeBackgroundTheme;
      case "Approved" || "مقبولة":
        return Palette.green;
      case "Rejected" || "مرفوض":
        return Palette.redBackgroundTheme;
      default:
        return Palette.grey_7B7B7B;
    }
  }

  Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    String yesText = 'Yes',
    String noText = 'No',
    Color? yesColor,
    Color? noColor,
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(
                noText,
                style: TextStyle(color: noColor),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            TextButton(
                child: Text(
                  yesText,
                  style: TextStyle(color: yesColor),
                ),
                onPressed: () {
                  // approveLeaveRequestCubit
                  //     .createApproveLeaveRequest(ApproveLeaveRequestModel(
                  //   leaveRequestID: submissionsEntity.id,
                  // ));
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}
