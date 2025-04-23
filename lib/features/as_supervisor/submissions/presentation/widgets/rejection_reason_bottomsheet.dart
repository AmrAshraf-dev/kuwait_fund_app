import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
 import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/reject_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/entities/submission_entity.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/cubits/reject_leave_request_cubit/reject_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_area_field_widget.dart';

class RejectionReasonBottomSheet extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final RejectLeaveRequestCubit rejectLeaveRequestCubit;
  final SubmissionEntity? submissionsEntity;
  RejectionReasonBottomSheet(
      {super.key,
      this.submissionsEntity,
      required this.rejectLeaveRequestCubit});
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r),
              topRight: Radius.circular(35.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom * 0.6, // Reduce height
                ),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      10.verticalSpace,
                      AppText(
                        text: context.tr("reason_for_rejection"),
                        style: AppTextStyle.bold_22,
                      ),
                      10.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: TextAreaFieldWidget(
                            labelAboveField: context.tr("remarks"),
                            keyName: "reason_for_rejection",
                            validator: FormBuilderValidators.required(),
                            controller: controller,
                          ),
                        ),
                      ),
                      50.verticalSpace,
                      Column(
                        children: [
                          CustomElevatedButton(
                            height: 60.h,
                            text: context.tr("submit"),
                            onPressed: () {
                              if (_formKey.currentState!.saveAndValidate()) {
                                Navigator.pop(context);
                                rejectLeaveRequestCubit
                                    .createRejectLeaveRequest(RejectLeaveRequestModel(
                                  leaveRequestID: submissionsEntity?.id,
                                  rejectReson: _formKey.currentState!.fields["reason_for_rejection"]!.value.toString(),
                                ));
                              }
                            },
                          ),
                          22.verticalSpace,
                          Center(
                            child: CustomElevatedButton(
                                height: 50.h,
                                backgroundColor: Palette.transparntColor,
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                customChild: AppText(
                                  text: context.tr("cancel"),
                                  textColor: Palette.blue_5490EB,
                                  fontSize: 18.sp,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
