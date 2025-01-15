import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/beneficiary_cubit/beneficiary_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

class AddBeneficiaryItem extends StatelessWidget {
  AddBeneficiaryItem(
    this.beneficiaryCubit, {
    super.key,
  });

  final BeneficiaryCubit beneficiaryCubit;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
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
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: Column(
                  children: [
                    TextFieldWidget(
                      labelAboveField: context.tr("beneficiary_name"),
                      keyName: "beneficiaryName",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(3),
                        FormBuilderValidators.maxLength(50),
                        FormBuilderValidators.alphabetical(
                            regex:
                                RegExp(r'^[^\d\u0660-\u0669\u06F0-\u06F9]+$')),
                      ]),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                    ),
                    20.verticalSpace,
                    TextFieldWidget(
                      labelAboveField: context.tr("civil_id"),
                      keyName: "civilId",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.minLength(12),
                        FormBuilderValidators.maxLength(12),
                      ]),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                    ),
                    20.verticalSpace,
                    CustomDropDownField<String>(
                      keyName: "relationshipWithBeneficiary",
                      labelText: context.tr("relationship_with_beneficiary"),
                      disableSearch: true,
                      disableFiled: false,
                      labelAboveField:
                          context.tr("relationship_with_beneficiary"),
                      onChanged: (
                        String? newSelectedService,
                      ) {},
                      items: <String>['Spouse', 'child'].map((String item) {
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
                      onPressed: () {
                        if (!_formKey.currentState!.saveAndValidate()) return;
                        beneficiaryCubit.addBeneficiary(
                          _formKey
                              .currentState!.fields["beneficiaryName"]!.value,
                          _formKey.currentState!.fields["civilId"]!.value,
                          _formKey.currentState!
                              .fields["relationshipWithBeneficiary"]!.value,
                        );
                        _formKey.currentState!
                            .reset(); // Clear all fields without showing validation errors
                      },
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black,
                      textStyle: AppTextStyle.medium_16,
                      text: context.tr("add_beneficiary"),
                    )
                  ],
                ),
              ))),
    );
  }
}
