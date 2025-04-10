import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/half_circle_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_info_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/annual_leave_details_history_cubit/annual_leave_details_history_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/annual_leave_info_cubit/annual_leave_info_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/leave_history_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/advanced_expandable_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/date_picker_range_bottomsheet_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/timeline_card_widget.dart';
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
  //

  @override
  void initState() {
    annualLeaveDetailsHistoryCubit.getAnnualLeaveDetailsHistory(
        annualLeaveDetailsRequestModel: AnnualLeaveDetailsRequestModel(
            startDate: '8/4/2025', endDate: '8/5/2025'));
    // annualLeaveInfoCubit.getAnnualLeaveInfo(
    //     annualLeaveInfoRequestModel:
    //         AnnualLeaveInfoRequestModel(leaveRequestID: widget.requestID)
    //    );

    ///api/Request/GetUserRequests/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String leaveUsed = annualLeaveInfoEntityResponse?.leavDaysTaken ?? '26';
    int leaveDaysTaken = int.parse(leaveUsed);
    String totalLeave =
        annualLeaveInfoEntityResponse?.leaveRequestsCount ?? '30';
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
              onTap: () {
                ViewsToolbox.showBottomSheet(
                    height: 1.sh - 200,
                    context: context,
                    widget: RangeDatePickerBottomsheetWidget(
                      isReadOnly: true,
                      selectedRange: DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now().add(const Duration(days: 7)),
                      ),
                      //    labelTitle: context.tr("applied_for"),
                      onDoneCallback: (bool isSelectedRangeValid) {},
                      //consumedDays: 26,
                      // totalDays: 30
                    ));
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
                            text: annualLeaveInfoEntityResponse?.requestDate ??
                                '01/01/2021',
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
                      HalfCircleChartWidget(
                        leaveUsed: leaveDaysTaken,
                        totalLeave: leaveRequestsCount,
                        height: 80.h,
                        width: 120.w,
                        color: Colors.blueAccent,
                        title:
                            "${context.tr('from')} ${annualLeaveInfoEntityResponse?.requestStartDate ?? '01/01/2021'} ",
                        subTitle:
                            "${context.tr('to')} ${annualLeaveInfoEntityResponse?.requestStartDate ?? '01/01/2022'}",
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
                          startDate: '4/4/2025', endDate: '4/5/2025'),
                ),
            ),
            BlocProvider(
              create: (context) => annualLeaveInfoCubit
                ..getAnnualLeaveInfo(
                  annualLeaveInfoRequestModel:
                      AnnualLeaveInfoRequestModel(leaveRequestID: '22'),
                ),
            ),
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
                                      title: context.tr("paid_days"),
                                      days: annualLeaveInfoEntityResponse
                                              ?.shortSickDays ??
                                          '4',
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    ),
                                    LeaveDaysRowItemWidget(
                                      title: context
                                          .tr("remaining_days_after_vacation"),
                                      days: annualLeaveInfoEntityResponse
                                              ?.tolalExecese ??
                                          '4',
                                    ),
                                    5.verticalSpace,
                                  ]),
                            )),
                        20.verticalSpace,
                        // MainTitleWidget(
                        //   title: context.tr("track_request"),
                        // ),
                        // ApprovalTimeline(),

                        BlocConsumer<AnnualLeaveDetailsHistoryCubit,
                            AnnualLeaveDetailsHistoryState>(
                          listener: (context, state) {
                            if (state is AnnualLeaveDetailsHistoryErrorState) {
                              ViewsToolbox.dismissLoading();
                              ViewsToolbox.showErrorAwesomeSnackBar(
                                  context, state.message ?? '');
                            }
                          },
                          builder: (context, state) {
                            if (state
                                is AnnualLeaveDetailsHistoryLoadingState) {
                              ViewsToolbox.showLoading();
                            } else if (state
                                is AnnualLeaveDetailsHistoryReadyState) {
                              annualLeaveDetailsEntityResponse =
                                  state.response.data ?? [];
                              ViewsToolbox.dismissLoading();
                              return AdvancedExpandableSection(
                                  headerPadding:
                                      const EdgeInsetsDirectional.only(
                                          start: 20, top: 20, bottom: 20),
                                  customText: SizedBox(
                                      width: 240.w,
                                      child: MainTitleWidget(
                                          title: context.tr("leave_history"))),
                                  children: annualLeaveDetailsEntityResponse!
                                      .map((AnnualLeaveDetailsEntity
                                          annualLeaveDetailsEntity) {
                                    return LeaveHistoryItemWidget(
                                      annualLeaveDetailsEntity:
                                          annualLeaveDetailsEntity,
                                    );
                                  }).toList());
                            }
                            // print(
                            //     'RESPONSE : ${annualLeaveDetailsEntityResponse?.first.leaveStatus ?? 'null1'}');
                            return Container();
                          },
                        ),
                        20.verticalSpace,

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
                            CustomElevatedButton(
                              text: context.tr('approve'),//extend
                              backgroundColor: Palette.greenBackgroundTheme,
                              width: 150.w,
                              height: 50.h,
                              onPressed: () {},
                            ),
         //choose from calendar from and to date 
         //
                            //reject
                            CustomElevatedButton(
                              text: context.tr('reject'),//delete
                              backgroundColor: Palette.redBackgroundTheme,
                              width: 150.w,
                              height: 50.h,
                              onPressed: () {},
                            ),
                            //new viewToolBox
                          ],
                        )
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
      case "Rejected" || "ملغية":
        return Palette.redBackgroundTheme;
      default:
        return Palette.grey_7B7B7B;
    }
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
