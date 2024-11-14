import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_timer_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_area_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class CreateTrainingRequestScreen extends StatefulWidget {
  const CreateTrainingRequestScreen({super.key});

  @override
  State<CreateTrainingRequestScreen> createState() =>
      _CreateTrainingRequestScreenState();
}

class _CreateTrainingRequestScreenState
    extends State<CreateTrainingRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("training"),
        widget: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          child: Container(
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
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    20.verticalSpace,
                    CustomDropDownField<String>(
                      keyName: "courseType",
                      labelText: context.tr("course_type"),
                      disableSearch: true,
                      disableFiled: false,
                      labelAboveField: context.tr("course_type"),
                      onChanged: (
                        String? newSelectedService,
                      ) {},
                      items:
                          <String>['internal', 'external'].map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: AppText(
                            text: item,
                            style: AppTextStyle.medium_18,
                          ),
                        );
                      }).toList(),
                      itemsSearchable: <String>['internal', 'external']
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
                    20.verticalSpace,
                    TextFieldWidget(
                      labelAboveField: context.tr("course_location"),
                      keyName: "courseLocation",
                      validator: FormBuilderValidators.required(),
                      textInputAction: TextInputAction.next,
                    ),
                    20.verticalSpace,
                    TextFieldWidget(
                      labelAboveField: context.tr("organizer"),
                      keyName: "organizer",
                      validator: FormBuilderValidators.required(),
                      textInputAction: TextInputAction.next,
                    ),
                    20.verticalSpace,
                    CustomSingleRangeDatePicker(
                      fromLabelAboveField: context.tr("start_date"),
                      customFormKey: _formKey,
                      keyNameFrom: "startDate",
                    ),
                    20.verticalSpace,
                    CustomSingleRangeDatePicker(
                      fromLabelAboveField: context.tr("end_date"),
                      customFormKey: _formKey,
                      keyNameFrom: "endDate",
                    ),
                    20.verticalSpace,
                    CustomSingleTimePicker(
                      fromLabelAboveField: context.tr("start_time"),
                      customFormKey: _formKey,
                      keyNameFrom: "startTime",
                      icon: Assets.svg.clock.path,
                    ),
                    20.verticalSpace,
                    CustomSingleTimePicker(
                      fromLabelAboveField: context.tr("end_time"),
                      customFormKey: _formKey,
                      keyNameFrom: "endTime",
                      icon: Assets.svg.clock.path,
                    ),
                    20.verticalSpace,
                    TextAreaFieldWidget(
                      labelAboveField: context.tr("training_goals"),
                      keyName: "trainingGoals",
                      validator: FormBuilderValidators.required(),
                    ),
                    26.verticalSpace,
                    GenericFilePicker(
                      filePickerCubit: FilePickerCubit(),
                      isFromFile: true,
                      keyName: 'file',
                      buttonTitle: context.tr("attach_course_file"),
                    ),
                    50.verticalSpace,
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
                    50.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
