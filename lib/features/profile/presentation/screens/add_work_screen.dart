import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class AddWorkScreen extends StatefulWidget {
  const AddWorkScreen({super.key});

  @override
  State<AddWorkScreen> createState() => _AddWorkScreenState();
}

class _AddWorkScreenState extends State<AddWorkScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool isChild = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("addWorkExperience"),
      isBackEnabled: true,
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
                        labelAboveField: context.tr("company"),
                        keyName: "company",
                        validator: FormBuilderValidators.required(),
                        textInputAction: TextInputAction.next,
                      ),
                      20.verticalSpace,
                      TextFieldWidget(
                        labelAboveField: context.tr("position"),
                        keyName: "position",
                        validator: FormBuilderValidators.required(),
                        textInputAction: TextInputAction.next,
                      ),
                      20.verticalSpace,
                      CustomSingleRangeDatePicker(
                        fromLabelAboveField: context.tr("start_date"),
                        customFormKey: _formKey,
                        keyNameFrom: "start_date",
                      ),
                      20.verticalSpace,
                      CustomSingleRangeDatePicker(
                        fromLabelAboveField: context.tr("end_date"),
                        customFormKey: _formKey,
                        keyNameFrom: "end_date",
                      ),
                      40.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
            126.verticalSpace,
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


