import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class CreateInsuranceRequestScreen extends StatefulWidget {
  const CreateInsuranceRequestScreen({super.key});

  @override
  State<CreateInsuranceRequestScreen> createState() =>
      _CreateInsuranceRequestScreenState();
}

class _CreateInsuranceRequestScreenState
    extends State<CreateInsuranceRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      isBackEnabled: true,
      screenTitle: context.tr("add_insurance"),
      widget: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    child: Column(
                      children: [
                        CustomDropDownField<String>(
                          keyName: "insuranceCompany",
                          labelText: context.tr("insurance_company"),
                          disableSearch: true,
                          disableFiled: false,
                          labelAboveField: context.tr("insurance_company"),
                          onChanged: (
                            String? newSelectedService,
                          ) {},
                          items: <String>[
                            'Kuwait Insurance Company',
                            'company 2',
                          ].map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: AppText(
                                text: item,
                                style: AppTextStyle.medium_18,
                              ),
                            );
                          }).toList(),
                          itemsSearchable: <String>[
                            'Kuwait Insurance Company',
                            'company 2',
                          ]
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
                        CustomSingleRangeDatePicker(
                          validator: (String? value) =>
                              AppValidator.validatorRequired(
                            value,
                            context,
                          ),
                          fromLabelAboveField:
                              context.tr("suscription_start_date"),
                          customFormKey: _formKey,
                          keyNameFrom: "startDate",
                        ),
                        20.verticalSpace,
                        CustomDropDownField<String>(
                          keyName: "insuranceProgram",
                          labelText: context.tr("insurance_program"),
                          disableSearch: true,
                          disableFiled: false,
                          labelAboveField: context.tr("insurance_program"),
                          onChanged: (
                            String? newSelectedService,
                          ) {},
                          items:
                              <String>['1 Year', '2 Years'].map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: AppText(
                                text: item,
                                style: AppTextStyle.medium_18,
                              ),
                            );
                          }).toList(),
                          itemsSearchable: <String>['1 Year', '2 Years']
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
                      ],
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: MainTitleWidget(title: context.tr("beneficiaries")),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 20.h),
                        child: Column(
                          children: [
                            TextFieldWidget(
                              labelAboveField: context.tr("beneficiary_name"),
                              keyName: "beneficiaryName",
                              validator: FormBuilderValidators.required(),
                              textInputAction: TextInputAction.next,
                            ),
                            20.verticalSpace,
                            TextFieldWidget(
                              labelAboveField: context.tr("civil_id"),
                              keyName: "civilId",
                              validator: FormBuilderValidators.required(),
                              textInputAction: TextInputAction.next,
                            ),
                            20.verticalSpace,
                            CustomDropDownField<String>(
                              keyName: "relationshipWithBeneficiary",
                              labelText:
                                  context.tr("relationship_with_beneficiary"),
                              disableSearch: true,
                              disableFiled: false,
                              labelAboveField:
                                  context.tr("relationship_with_beneficiary"),
                              onChanged: (
                                String? newSelectedService,
                              ) {},
                              items: <String>['Spouse', 'child']
                                  .map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: AppText(
                                    text: item,
                                    style: AppTextStyle.medium_18,
                                  ),
                                );
                              }).toList(),
                              itemsSearchable: <String>['Spouse', 'child']
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
                            CustomElevatedButton(
                              height: 48.h,
                              showBorder: true,
                              borderColor: Palette.grey_9C9C9C,
                              onPressed: () {},
                              backgroundColor: Colors.transparent,
                              textColor: Colors.black,
                              textStyle: AppTextStyle.medium_16,
                              text: context.tr("add_beneficiary"),
                            )
                          ],
                        ),
                      ))),
              Center(
                child: CustomElevatedButton(
                  text: context.tr("submit"),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value);
                      CustomMainRouter.push(ThankYouRoute(
                        subtitle: context
                            .tr("you_insurance_request_submitted_successfully"),
                      ));
                    }
                  },
                ),
              ),
              50.verticalSpace,
            ],
          )),
    );
  }
}
