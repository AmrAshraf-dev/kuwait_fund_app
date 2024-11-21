import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("address"),
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
                          labelAboveField: context.tr("government"),
                          keyName: "government",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("street"),
                          keyName: "street",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("block"),
                          keyName: "block",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("buildingNumber"),
                          keyName: "buildingNumber",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("floor"),
                          keyName: "floor",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("flat"),
                          keyName: "flat",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                        ),
                        40.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              33.verticalSpace,
              CustomElevatedButton(
                text: context.tr("submit"),
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    print(_formKey.currentState!.value);
                    CustomMainRouter.push(ThankYouRoute(
                      subtitle: context.tr(
                          "submitted_successfully_waiting_administrator"),
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