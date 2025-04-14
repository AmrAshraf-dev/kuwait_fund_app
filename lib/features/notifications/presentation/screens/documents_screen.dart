// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
// import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
// import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

// @RoutePage()
// class DocumentsScreen extends StatefulWidget {
//   const DocumentsScreen({super.key , this.isVerified});

//   final bool? isVerified;

//   @override
//   State<DocumentsScreen> createState() => _DocumentsScreenState();
// }

// class _DocumentsScreenState extends State<DocumentsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MasterWidget(
//       screenTitle: context.tr("documents"),
//       widget: Column(
//         children: [
//           30.verticalSpace,
//           DocumentsCard(title: context.tr('loanAgreement'), isVerified: widget.isVerified ?? false),
//           20.verticalSpace,
//           DocumentsCard(title: context.tr('loanContract') , isVerified: widget.isVerified ?? false),
//           30.verticalSpace,
//           CustomElevatedButton(
//             onPressed: () {},
//             backgroundColor:  widget.isVerified ?? false ? Palette.blue_5490EB: Palette.grey_D6D8DC,
//             borderColor: Palette.gray_B6B7B8,
//             showBorder: true,
//             text: context.tr("submit"),
//             textColor: Palette.white,
//             textStyle: AppTextStyle.semiBold_20,
//             width: 348.w,
//             height: 66.h,
//             radius: 10.r,
//           ),
//         ],
//       ),
//     );
//   }
// }


// class DocumentsCard extends StatelessWidget {
//   final String title;
//   final bool isVerified;

//   const DocumentsCard({
//     super.key,
//     required this.title,
//     required this.isVerified,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 260.h,
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
//           padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 30.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Assets.svg.pdf.svg(),
//               6.verticalSpace,
//               AppText(
//                 text: title,
//                 style: AppTextStyle.bold_22,
//                 textColor: Palette.black_2A2A2A,
//               ),
//               15.verticalSpace,
//               if(!isVerified) ...[
//                 CustomElevatedButton(
//                   onPressed: () {
//                     CustomMainRouter.push(SignPaciRoute());
//                   },
//                   backgroundColor: Palette.white,
//                   borderColor: Palette.gray_B6B7B8,
//                   showBorder: true,
//                   customChild: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Assets.png.paci.image(),
//                       6.horizontalSpace,
//                       AppText(
//                         text: context.tr("signWithPACI"),
//                         style: AppTextStyle.semiBold_16,
//                         textColor: Palette.black,
//                       ),
//                     ],
//                   ),
//                   width: 270.w,
//                   height: 53.h,
//                   radius: 10.r,
//                 ),
//                 10.verticalSpace,
//               ],
//               InkWell(
//                 onTap: () {
//                   loanPopUp(context: context);
//                 },
//                 child: AppText(
//                   text: context.tr("viewDocument"),
//                   style: AppTextStyle.semiBold_20,
//                   textColor: Palette.blue_5490EB,
//                 ),
//               ),
//               if(isVerified)...[
//                 18.verticalSpace,
//                 Container(
//                   height: 48.h,
//                   width: 141.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40.r),
//                     border: Border.all(
//                       color: Palette.green_457403,
//                       width: 1.0,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Assets.svg.verified.svg(),
//                       AppText(
//                         text: context.tr("signed"),
//                         style: AppTextStyle.semiBold_18,
//                         textColor: Palette.green_457403,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ));
//   }
// }


// void loanPopUp({
//   required BuildContext context,
// }) async {
//   return showDialog<void>(
//       context: context,
//       barrierDismissible: true,
//       useSafeArea: true,
//       builder: (BuildContext context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Assets.png.loanAgreement.image(),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 60.w),
//                   child: AppText(
//                     text: 'This Loan Agreement ("Agreement") is made between [Lender\'s Name] ("Lender") and [Borrower\'s Name] ("Borrower") on [Date]. The Lender agrees to provide a loan of [Loan Amount] to the Borrower, which shall be repaid in accordance with the terms outlined herein. The loan will incur an interest rate of [Interest Rate]% per annum, with repayments due on [Repayment Schedule]. Both parties acknowledge that this Agreement represents a binding commitment to the terms outlined and that any amendments must be documented in writing and signed by both parties.\nThe Borrower agrees to use the loan proceeds solely for [Purpose of Loan]. In the event of a default on any payment, the Lender reserves the right to impose late fees, accelerate the remaining balance, or take legal action to recover the outstanding amount.',
//                     style: AppTextStyle.regular_12,
//                     textColor: Palette.black,
//                   ),
//                 ),
//               ],
//             ),
//             20.verticalSpace,
//             InkWell(
//               onTap: () {
//                 CustomMainRouter.pop();
//               },
//               child: AppText(
//                 text: context.tr("close"),
//                 style: AppTextStyle.semiBold_20,
//                 textColor: Palette.white,
//               ),
//             ),
//           ],
//         );
//       });
// }
