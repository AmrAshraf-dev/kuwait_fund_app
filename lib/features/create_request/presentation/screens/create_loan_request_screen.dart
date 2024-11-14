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
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class CreateLoanRequestScreen extends StatefulWidget {
  const CreateLoanRequestScreen({super.key});

  @override
  State<CreateLoanRequestScreen> createState() =>
      _CreateLoanRequestScreenState();
}

class _CreateLoanRequestScreenState extends State<CreateLoanRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      isBackEnabled: true,
      screenTitle: context.tr("loan"),
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
                        TextFieldWidget(
                          labelAboveField: context.tr("loan_amount"),
                          keyName: "loanAmount",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        CustomDropDownField<String>(
                          keyName: "purposeOfLoan",
                          labelText: context.tr("purpose_of_loan"),
                          disableSearch: true,
                          disableFiled: false,
                          labelAboveField: context.tr("purpose_of_loan"),
                          onChanged: (
                            String? newSelectedService,
                          ) {},
                          items: <String>[
                            'Housing',
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
                            'Housing',
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
                        TextFieldWidget(
                          labelAboveField: context.tr("number_of_installments"),
                          keyName: "numberOfInstallments",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("monthly_installment"),
                          keyName: "monthlyInstallment",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: CustomElevatedButton(
                  text: context.tr("submit"),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value);
                      CustomMainRouter.push(ThankYouRoute(
                        subtitle: context
                            .tr("you_loan_request_submitted_successfully"),
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
