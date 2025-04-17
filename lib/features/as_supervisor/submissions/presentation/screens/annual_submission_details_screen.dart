// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/constants/images.dart';
// import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
// import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/rejection_reason_bottomsheet.dart';
// import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/submission_leave_item_widget.dart';
// import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/half_circle_chart_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/advanced_expandable_section_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/employee_details_card_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/timeline_card_widget.dart';
// import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

// @RoutePage()
// class AnnualSubmissionsDetailsScreen extends StatelessWidget {
//   AnnualSubmissionsDetailsScreen({super.key});
//   List<RequestHistory> requestHistory = [
//     RequestHistory(
//       type: "Annual Leave",
//       date: "01/01/2021",
//       status: "approved",
//       days: "4",
//     ),
//     RequestHistory(
//       type: "Annual Leave",
//       date: "01/01/2021",
//       status: "approved",
//       days: "4",
//     ),
//     RequestHistory(
//       type: "Annual Leave",
//       date: "01/01/2021",
//       status: "approved",
//       days: "4",
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MasterWidget(
//         waterMarkImage: waterMarkImage4,
//         appBarHeight: 340.h,
//         isBackEnabled: true,
//         screenTitle: context.tr("annual_leave_request"),
//         appBarBody: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // app text date
//                 AppText(
//                   text: "01/01/2021",
//                   style: AppTextStyle.semiBold_12,
//                   textColor: Palette.white,
//                 ),
//                 Assets.svg.calander.svg(width: 28.w, height: 28.h),
//               ],
//             ),
//             10.verticalSpace,
//             AppText(
//               text: context.tr("applied_for"),
//               style: AppTextStyle.semiBold_16,
//               textColor: Palette.white,
//             ),
//             10.verticalSpace,
//             HalfCircleChartWidget(
//               leaveUsed: 26,
//               totalLeave: 30,
//               height: 80.h,
//               width: 120.w,
//               color: Colors.blueAccent,
//               title: "${context.tr('from')} 01/01/2021 ",
//               subTitle: "${context.tr('to')} 01/01/2022",
//             ),
//             10.verticalSpace,
//             Container(
//               decoration: BoxDecoration(
//                 color: Palette.green_07BF0D,
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: AppText(
//                   text: context.tr("approved"),
//                   style: AppTextStyle.semiBold_16,
//                   textColor: Palette.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         widget: Padding(
//             padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(25.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Container(
//                     margin:
//                         EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//                     decoration: BoxDecoration(
//                       color: Palette.white_F7F7F7,
//                       borderRadius: BorderRadius.circular(25.r),
//                     ),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           5.verticalSpace,
//                           LeaveDaysRowItemWidget(
//                             title: context.tr("paid_days"),
//                             days: "4",
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 25.w),
//                             child: Divider(
//                               thickness: 1,
//                             ),
//                           ),
//                           LeaveDaysRowItemWidget(
//                             title: context.tr("remaining_days_after_vacation"),
//                             days: "4",
//                           ),
//                           5.verticalSpace,
//                         ]),
//                   )),
//               20.verticalSpace,
//               EmployeeDetailsCardWidget(
//                 employee: Employee(
//                   phone: "",
//                   name: "Ahmed Mohamed",
//                   position: "Software Engineer",
//                   department: "IT",
//                   email: "",
//                 ),
//               ),
//               10.verticalSpace,
//               MainTitleWidget(
//                 title: context.tr("track_request"),
//               ),
//               ApprovalTimeline(),
//               20.verticalSpace,
//               AdvancedExpandableSection(
//                 headerPadding: const EdgeInsetsDirectional.only(
//                     start: 20, top: 20, bottom: 20),
//                 customText: SizedBox(
//                     width: 240.w,
//                     child: MainTitleWidget(title: context.tr("leave_details"))),
//                 children: requestHistory.map((RequestHistory requestHistory) {
//                   return SubmissionLeaveItemWidget(
//                     requestHistory: requestHistory,
//                   );
//                 }).toList(),
//               ),
//               40.verticalSpace,
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomElevatedButton(
//                       width: 175.w,
//                       height: 70.h,
//                       backgroundColor: Palette.green_5CAC00,
//                       onPressed: () {},
//                       customChild: AppText(
//                         text: context.tr("approve"),
//                         style: AppTextStyle.semiBold_13,
//                         textColor: Palette.white,
//                       )),
//                   10.horizontalSpace,
//                   CustomElevatedButton(
//                       width: 175.w,
//                       height: 70.h,
//                       backgroundColor: Palette.red_FF0606,
//                       onPressed: () {
//                         ViewsToolbox.showBottomSheet(
//                             context: context,
//                             height: 400.h,
//                             customWidget: RejectionReasonBottomSheet());
//                       },
//                       customChild: AppText(
//                         text: context.tr("reject"),
//                         style: AppTextStyle.semiBold_13,
//                         textColor: Palette.white,
//                       ))
//                 ],
//               ),
//               30.verticalSpace,
//               Center(
//                 child: CustomElevatedButton(
//                     width: 200.w,
//                     height: 50.h,
//                     backgroundColor: Palette.transparntColor,
//                     onPressed: () {
//                       CustomMainRouter.pop();
//                     },
//                     customChild: AppText(
//                       text: context.tr("cancel"),
//                       textColor: Palette.blue_5490EB,
//                       fontSize: 18.sp,
//                     )),
//               ),
//             ])));
//   }
// }

// class RequestHistory {
//   final String type;
//   final String date;
//   final String status;
//   final String days;

//   RequestHistory({
//     required this.type,
//     required this.date,
//     required this.status,
//     required this.days,
//   });
// }

// class ApprovalTimeline extends StatelessWidget {
//   const ApprovalTimeline({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         10.verticalSpace,
//         TimeLineCard(
//           name: "Ahmed Al-Rashid",
//           position: "You",
//           status: "Approved",
//           isFirst: true,
//           isLast: false,
//         ),
//         TimeLineCard(
//           name: "Ahmed Al-Rashid",
//           position: "You",
//           status: "Approved",
//           isFirst: false,
//           isLast: true,
//         ),
//       ],
//     );
//   }
// }
