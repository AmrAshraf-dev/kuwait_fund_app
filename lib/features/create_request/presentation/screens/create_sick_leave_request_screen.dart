import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/custom_date_picker_range.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class CreateSickLeaveRequestScreen extends StatefulWidget {
  const CreateSickLeaveRequestScreen({super.key});

  @override
  State<CreateSickLeaveRequestScreen> createState() =>
      _CreateSickLeaveRequestScreenState();
}

class _CreateSickLeaveRequestScreenState
    extends State<CreateSickLeaveRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage2,
        screenTitle: context.tr("sick_leave"),
        appBarHeight: 90.h,
        isBackEnabled: true,
        widget: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      onDoneCallback: (bool isSelectedRangeValid) {},
                      labelTitle: context.tr("sick_leave_days"),
                      consumedDays: 4,
                      totalDays: 4,
                      keyNameFrom: "from",
                      keyNameTo: "to",
                      customFormKey: _formKey,
                      fromLabelAboveField: context.tr("from"),
                      toLabelAboveField: context.tr("to"),
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
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                            days: "4",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          LeaveDaysRowItemWidget(
                            title: context.tr("remaining_days_after_vacation"),
                            days: "4",
                          ),
                          5.verticalSpace,
                        ]),
                  )),
              120.verticalSpace,
              CustomElevatedButton(
                  onPressed: () {
                    CustomMainRouter.push(
                      ThankYouRoute(
                      title: context.tr("request_submitted_successfully"),
                      subtitle: context.tr(
                          "your_sick_leave_request_has_been_submitted_successfully"),
                    ));
                  },
                  text: context.tr("submit"))
            ])));
  }
}
