import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("Edit Profile"),
        widget: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          child: Column(
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
                child: FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("Name"),
                          keyName: "Name",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("Job Title"),
                          keyName: "Job Title",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("Email"),
                          keyName: "Email",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("Phone"),
                          keyName: "Phone",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        AppText(
                          text: context.tr("Add Number"),
                          style: AppTextStyle.medium_14,
                          textColor: Palette.blue_5490EB,
                        ),
                        30.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("Passport Number"),
                          keyName: "Passport Number",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        CustomSingleRangeDatePicker(
                          fromLabelAboveField: context.tr("Passport Expiry Date"),
                          customFormKey: _formKey,
                          keyNameFrom: "Passport Expiry Date",
                        ),
                        60.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              80.verticalSpace,
              CustomElevatedButton(
                text: context.tr("submit"),
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    print(_formKey.currentState!.value);
                    CustomMainRouter.push(ThankYouRoute(
                      subtitle: context.tr(
                          "you_training_request_submitted_successfully"),
                    ));
                  }
                },
              ),
              20.verticalSpace,
            ],
          ),
        ));
  }
}
