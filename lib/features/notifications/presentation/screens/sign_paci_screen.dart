// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
// import 'package:kf_ess_mobile_app/gen/assets.gen.dart';
// import 'package:timer_count_down/timer_count_down.dart';

// @RoutePage()
// class SignPaciScreen extends StatefulWidget {
//   const SignPaciScreen({super.key});

//   @override
//   State<SignPaciScreen> createState() => _SignPaciScreenState();
// }

// class _SignPaciScreenState extends State<SignPaciScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MasterWidget(
//       screenTitle: context.tr("signWithPACI"),
//       widget: Column(
//         children: [
//           20.verticalSpace,
//           CheckPhoneCard(),
//           32.verticalSpace,
//           InkWell(
//             onTap: () {
//               context.router.push(DocumentsRoute(isVerified: true));
//             },
//             child: AppText(
//               text: context.tr('cancel'),
//               style: AppTextStyle.regular_18,
//               textColor: Palette.blue_5490EB,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CheckPhoneCard extends StatelessWidget {
//   const CheckPhoneCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 590.h,
//         width: 364.w,
//         margin: EdgeInsets.symmetric(horizontal: 15.w),
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Palette.grey_7B7B7B.withOpacity(0.2),
//               blurRadius: 10.0,
//               offset: Offset(0, 4),
//             ),
//           ],
//           color: Palette.white,
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 23.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               AppText(
//                 text: context.tr('CheckYourPhone'),
//                 style: AppTextStyle.semiBold_20,
//                 textColor: Palette.black_2A2A2A,
//               ),
//               18.verticalSpace,
//               Assets.png.paciPhone.image(),
//               24.verticalSpace,
//               MainTitleWidget(
//                 title: context.tr('paciTitle'),
//                 fontStyle: AppTextStyle.bold_24,
//                 isCenter: true,
//                 indicatorWidth: 81.w,
//               ),
//               24.verticalSpace,
//               AppText(
//                 text: context.tr('paciBody'),
//                 style: AppTextStyle.regular_16,
//                 textAlign: TextAlign.center,
//                 textColor: Palette.gery_6C6D6F,
//               ),
//               24.verticalSpace,
//               AppText(
//                 text: context.tr('timeoutAfter'),
//                 style: AppTextStyle.regular_16,
//                 textAlign: TextAlign.center,
//                 textColor: Palette.black,
//               ),
//               6.verticalSpace,
//               Container(
//                 height: 54.h,
//                 width: 134.w,
//                 decoration: BoxDecoration(
//                   color: Palette.white,
//                   borderRadius: BorderRadius.circular(12.r),
//                   border: Border.all(
//                     color: Palette.gray_C8C2C2,
//                     width: 1,
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Assets.svg.timer.svg(),
//                     Countdown(
//                       seconds: 60,
//                       build: (BuildContext context, double time) => AppText(
//                         text: time.toString(),
//                         style: AppTextStyle.regular_24,
//                         textColor: Palette.black,
//                       ),
//                       onFinished: () {},
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
