// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/constants/images.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/training_request_details_row_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/timeline_card_widget.dart';

// @RoutePage()
// class TrainingRequestDetailsScreen extends StatelessWidget {
//   const TrainingRequestDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MasterWidget(
//         waterMarkImage: waterMarkImage5,
//         appBarHeight: 100.h,
//         isBackEnabled: true,
//         screenTitle: context.tr("training_request"),
//         widget: Padding(
//             padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               40.verticalSpace,
//               MainTitleWidget(
//                 title: context.tr("request_details"),
//               ),
//               13.verticalSpace,
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
//                           TrainingRequestDetailsRowWidget(
//                             isFirst: true,
//                             title: "22-Aug-2024",
//                             subtitle: context.tr("pending"),
//                           ),
//                           TrainingRequestDetailsRowWidget(
//                             title: context.tr("course_type"),
//                             subtitle: context.tr("external"),
//                           ),
//                           TrainingRequestDetailsRowWidget(
//                             title: context.tr("course_location"),
//                             subtitle: context.tr("Riyadh"),
//                           ),
//                           TrainingRequestDetailsRowWidget(
//                             title: context.tr("from_date_time"),
//                             subtitle: "2/Jan/2025",
//                           ),
//                           TrainingRequestDetailsRowWidget(
//                             title: context.tr("to_date_time"),
//                             subtitle: "4/Jan/2025",
//                           ),
//                           TrainingRequestDetailsRowWidget(
//                             title: context.tr("training_goals"),
//                             subtitle: "goals",
//                             pdfUrl: "Course Name",
//                             isLast: true,
//                           ),
//                         ]),
//                   )),
//               20.verticalSpace,
//               MainTitleWidget(
//                 title: context.tr("track_request"),
//               ),
//               ApprovalTimeline(),
//             ])));
//   }
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
