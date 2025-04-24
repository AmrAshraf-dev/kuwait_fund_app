// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_check_box/check_box_cubit.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_check_box/custom_checkbox_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/forms/custom_date_picker_range.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

// class SubmissionFilterBottomSheet extends StatelessWidget {
//   final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
//   SubmissionFilterBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 0.68.sh,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(35.r),
//           topRight: Radius.circular(35.r),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   text: context.tr("filter"),
//                   style: AppTextStyle.bold_18,
//                 ),
//                 Row(
//                   children: [
//                     AppText(
//                       text: context.tr("26"),
//                       style: AppTextStyle.bold_14,
//                       textColor: Palette.gray_8D8686,
//                     ),
//                     5.horizontalSpace,
//                     AppText(
//                       text: context.tr("submissions"),
//                       style: AppTextStyle.medium_14,
//                       textColor: Palette.gray_8D8686,
//                     ),
//                   ],
//                 ),
//                 // x icon
//                 InkWell(
//                   onTap: () {
//                     CustomMainRouter.pop();
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Palette.primaryColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: Icon(
//                         Icons.close,
//                         color: Colors.white,
//                         size: 20.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             20.verticalSpace,
//             Divider(
//               color: Palette.gery_6C6D6F,
//             ),
//             20.verticalSpace,
//             MainTitleWidget(title: context.tr("submission_date")),
//             20.verticalSpace,
//             FormBuilder(
//                 key: _formKey,
//                 child: Flexible(
//                   child: SizedBox(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomDatePickerRange(
//                             keyNameFrom: "from",
//                             keyNameTo: "to",
//                             fromLabelAboveField: context.tr("from_date"),
//                             toLabelAboveField: context.tr("to_date"),
//                             customFormKey: _formKey,
//                             labelTitle: context.tr("date_range"),
//                             onDoneCallback: (bool isSelectedRangeValid,
//                                 DateTimeRange? pickedRange) {},
//                           ),
//                           20.verticalSpace,
//                           MainTitleWidget(
//                               title: context.tr("submission_category")),
//                           20.verticalSpace,
//                           CustomCheckbox(
//                             label: context.tr("annual_leave"),
//                             index: 0,
//                             checkboxCubit: CheckboxCubit(false),
//                           ),
//                           CustomCheckbox(
//                             label: context.tr("training_request"),
//                             index: 0,
//                             checkboxCubit: CheckboxCubit(false),
//                           ),
//                           CustomCheckbox(
//                             label: context.tr("loan_request"),
//                             index: 0,
//                             checkboxCubit: CheckboxCubit(false),
//                           ),
//                           CustomCheckbox(
//                             label: context.tr("insurance"),
//                             index: 0,
//                             checkboxCubit: CheckboxCubit(false),
//                           ),
//                           10.verticalSpace,
//                           MainTitleWidget(
//                               title: context.tr("submission_status")),
//                           20.verticalSpace,
//                           CustomCheckbox(
//                             label: context.tr("approved"),
//                             index: 0,
//                             checkboxCubit: CheckboxCubit(false),
//                           ),
//                           CustomCheckbox(
//                             label: context.tr("rejected"),
//                             index: 0,
//                             checkboxCubit: CheckboxCubit(false),
//                           ),
//                           40.verticalSpace,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CustomElevatedButton(
//                                 width: 150.w,
//                                 backgroundColor: Colors.transparent,
//                                 onPressed: () {
//                                   _formKey.currentState!.reset();
//                                 },
//                                 customChild: AppText(
//                                   text: context.tr("clear_filters"),
//                                   textColor: Palette.blue_5490EB,
//                                   style: AppTextStyle.medium_18,
//                                 ),
//                               ),
//                               CustomElevatedButton(
//                                 width: 150.w,
//                                 onPressed: () {
//                                   if (_formKey.currentState!
//                                       .saveAndValidate()) {
//                                     print(_formKey.currentState!.value);
//                                     CustomMainRouter.pop();
//                                   }
//                                 },
//                                 customChild: AppText(
//                                   text: context.tr("apply_filters"),
//                                   style: AppTextStyle.semiBold_20,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
