// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/as_director/director_mission/presentation/widgets/director_mission/director_logs_bottomsheet.dart';

// class CalendarSectionWidget extends StatelessWidget {
//   final Widget? customChildWidget;
//   const CalendarSectionWidget({super.key, this.customChildWidget});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 20.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           CalendarCarousel<Event>(
//             scrollDirection: Axis.horizontal,
//             isScrollable: true,
//             customGridViewPhysics: NeverScrollableScrollPhysics(),
//             //  childAspectRatio: 0.9,

//             headerMargin: EdgeInsets.only(
//                 top: 0.h, bottom: 25.h, left: 25.w, right: 25.w),
//             weekdayTextStyle: TextStyle(color: Palette.blue_4379BD),
//             headerTextStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 21.sp,
//                 fontWeight: FontWeight.bold),
//             leftButtonIcon: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.r),
//                   color: Palette.primaryColor,
//                 ),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 )),
//             rightButtonIcon: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 color: Palette.primaryColor,
//               ),
//               child: Center(
//                 child: Icon(
//                   size: 20,
//                   Icons.arrow_forward_ios,
//                   color: Colors.white,
//                 ),
//               ),
//             ),

//             showOnlyCurrentMonthDate: true,
//             onDayPressed: (DateTime date, List<Event> events) {
//               // if date equals to 15th of November 2024, show the bottom sheet
//               if (date.day == 15 || date.month == 11 || date.year == 2024) {
//                 ViewsToolbox.showBottomSheet(
//                   height: 400.h,
//                   context: context,
//                   customWidget: AdminLogsBottomSheet(),
//                 );
//               }
//             },
//             weekendTextStyle: TextStyle(
//               color: Colors.black,
//             ),

//             customDayBuilder: (
//               /// you can provide your own build function to make custom day containers
//               bool isSelectable,
//               int index,
//               bool isSelectedDay,
//               bool isToday,
//               bool isPrevMonthDay,
//               TextStyle textStyle,
//               bool isNextMonthDay,
//               bool isThisMonthDay,
//               DateTime day,
//             ) {
//               /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
//               /// This way you can build custom containers for specific days only, leaving rest as default.

//               // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
//               if (day.day == 15) {
//                 return Container(
//                   height: 1.sh,
//                   width: 1.sw,
//                   decoration: BoxDecoration(
//                     color: Palette.orange_FFB162,
//                     borderRadius: BorderRadius.circular(10.r),
//                     border: Border.all(color: Palette.green_457403, width: 2.0),
//                   ),
//                   child: Center(
//                     child: Text(
//                       day.day.toString(),
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 );
//               } else {
//                 return null;
//               }
//             },

//             height: 360.0.h,
//             selectedDateTime: DateTime.now(),
//             daysHaveCircularBorder: false,

//             daysTextStyle: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w600,
//               fontSize: 12.sp,
//             ),

//             /// null for not rendering any border, true for circular border, false for rectangular border
//           ),
//           if (customChildWidget != null) customChildWidget!,
//         ],
//       ),
//     );
//   }
// }
