// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kf_ess_mobile_app/core/constants/icons.dart';
// import 'package:kf_ess_mobile_app/core/constants/images.dart';
// import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
// import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

// class CustomBodyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool isBackEnabled;
//   final bool isDrawerEnabled;
//   final double appBarHeight;
//   final Widget? appBarBody;
//   final String? screenTitle;

//   const CustomBodyAppBar(
//       {super.key,
//       this.isBackEnabled = false,
//       this.isDrawerEnabled = false,
//       this.appBarHeight = 274.0,
//       this.appBarBody,
//       this.screenTitle});

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(appBarHeight.h),
//       child: Stack(
//         children: [
//           Container(
//             height: appBarHeight.h,
//             decoration: ShapeDecoration(
//               color: Palette.primaryColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(35.r),
//                     bottomRight: Radius.circular(35.r)),
//               ),
//             ),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Image.asset(
//                 height: 274.h,
//                 // fit: BoxFit.contain,
//                 waterMarkImage3,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           // Gradient overlay (optional for better readability of foreground text)
//           Container(
//             height: appBarHeight,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.black54, Colors.transparent],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           // Widgets above the background image
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: SafeArea(
//               bottom: false,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Directionality(
//                           textDirection: LanguageHelper.isAr(context)
//                               ? TextDirection.ltr
//                               : TextDirection.rtl,
//                           child: isBackEnabled
//                               ? GestureDetector(
//                                   onTap: () {
//                                     CustomMainRouter.pop();
//                                   },
//                                   child: Container(
//                                     height: 38.h,
//                                     width: 38.w,
//                                     padding: EdgeInsets.zero,
//                                     decoration: BoxDecoration(
//                                       color: Palette.yellow_FBD823,
//                                       borderRadius: BorderRadius.circular(10.r),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Icon(
//                                         size: 20,
//                                         LanguageHelper.isAr(context)
//                                             ? Icons.arrow_forward_ios
//                                             : Icons.arrow_back_ios,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : isDrawerEnabled
//                                   ? Builder(builder: (scaffoldContext) {
//                                       return InkWell(
//                                         onTap: () {
//                                           Scaffold.of(scaffoldContext)
//                                               .openDrawer();
//                                         },
//                                         child: LanguageHelper.isAr(context)
//                                             ? SvgPicture.asset(drawerArIcon)
//                                             : SvgPicture.asset(drawerIcon),
//                                       );
//                                     })
//                                   : SizedBox.shrink(),
//                         ),
//                         if (isBackEnabled || isDrawerEnabled)
//                           SizedBox(width: 11.w),
//                         Align(
//                             alignment: Alignment.center,
//                             child: AppText(
//                                 text: screenTitle,
//                                 style: AppTextStyle.bold_24,
//                                 textColor: Colors.white)),
//                       ],
//                     ),
//                     appBarBody ?? SizedBox.shrink(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(appBarHeight.h);
// }
