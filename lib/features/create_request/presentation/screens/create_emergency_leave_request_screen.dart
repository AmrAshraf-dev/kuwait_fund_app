import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_available_days_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/timeline_card_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class CreateEmergencyLeaveRequestScreen extends StatelessWidget {
  CreateEmergencyLeaveRequestScreen({super.key});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage2,
        screenTitle: context.tr("emergency_leave"),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Column(
                      children: [
                        CustomSingleRangeDatePicker(
                          labelTitle: context.tr("emergency_leave_days"),
                          consumedDays: 4,
                          totalDays: 4,
                          keyNameFrom: "from",
                          customFormKey: _formKey,
                          fromLabelAboveField: context.tr("emergency_date"),
                        ),
                        20.verticalSpace,
                        CustomDropDownField<String>(
                          keyName: "numberOfDays",
                          labelText: context.tr("number_of_days_required"),
                          disableSearch: true,
                          disableFiled: false,
                          labelAboveField:
                              context.tr("number_of_days_required"),
                          onChanged: (
                            String? newSelectedService,
                          ) {},
                          items:
                              <String>['1', '2', '3', '4'].map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: AppText(
                                text: item,
                                style: AppTextStyle.medium_18,
                              ),
                            );
                          }).toList(),
                          itemsSearchable: <String>['1', '2', '3', '4']
                              .map(
                                (String item) => <String, String>{
                                  item: item,
                                },
                              )
                              .toList(),
                          validator: (String? value) =>
                              AppValidator.validatorRequired(
                            value,
                            context,
                          ),
                        ),
                        15.verticalSpace,
                        Wrap(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Palette.orange_FF7904,
                            ),
                            5.horizontalSpace,
                            AppText(
                              text:
                                  "${context.tr("maximum_number_of_days_you_can_request")}: ",
                              style: AppTextStyle.regular_14,
                            ),
                            2.horizontalSpace,
                            AppText(
                              text: context.tr("5"),
                              style: AppTextStyle.bold_14,
                            ),
                          ],
                        ),
                        15.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
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
                    child: LeaveDaysRowItemWidget(
                      title: context.tr("remaining_days_after_vacation"),
                      days: "4",
                    ),
                  )),
              30.verticalSpace,
              SickLeaveAvailableDaysWidget(),
              26.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.svg.calander.svg(
                      width: 25.w, height: 25.h, color: Palette.primaryColor),
                  13.horizontalSpace,
                  AppText(
                      text: context.tr(
                        "view_my_attandance",
                      ),
                      textColor: Palette.blue_5490EB,
                      style: AppTextStyle.medium_18),
                ],
              ),
              120.verticalSpace,
              CustomElevatedButton(
                  onPressed: () {
                    CustomMainRouter.push(ThankYouRoute(
                      title: context.tr("request_submitted_successfully"),
                      subtitle: context.tr(
                          "your_emergency_leave_request_has_been_submitted_successfully"),
                    ));
                  },
                  text: context.tr("submit"))
            ])));
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
