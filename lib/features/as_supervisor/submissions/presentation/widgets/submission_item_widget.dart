import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/enums/request_type_enum.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/entities/submissions_entity.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/rejection_reason_bottomsheet.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class SubmissionItemWidget extends StatelessWidget {
  final SubmissionsEntity submissionsEntity;

  const SubmissionItemWidget({super.key, required this.submissionsEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (submissionsEntity.type == RequestTypeEnum.trainingRequest.name) {
          CustomMainRouter.push(TrainingSubmissionsDetailsRoute());
          return;
        } else if (submissionsEntity.type ==
            RequestTypeEnum.annualLeaveRequest.name) {
          CustomMainRouter.push(AnnualSubmissionsDetailsRoute());
        }
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
        child: Container(
            height: 185.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Palette.grey_7B7B7B.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
              color: Palette.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 18.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: submissionsEntity.date,
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Palette.orangeDark,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: context.tr(submissionsEntity.status!),
                            textColor: Colors.white,
                            style: AppTextStyle.semiBold_12,
                          ),
                        ),
                      )
                    ],
                  ),
                  //      11.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: context.tr(submissionsEntity.type!),
                            style: AppTextStyle.bold_16,
                            textColor: Palette.black,
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Assets.svg.person.svg(),
                              5.horizontalSpace,
                              AppText(
                                text: submissionsEntity.requesterName,
                                style: AppTextStyle.medium_14,
                                textColor: Palette.black,
                              ),
                              5.horizontalSpace,
                            ],
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              Assets.svg.blackCalander.svg(),
                              5.horizontalSpace,
                              AppText(
                                text:
                                    "${submissionsEntity.from} - ${submissionsEntity.to}",
                                style: AppTextStyle.medium_14,
                                textColor: Palette.black,
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              CustomElevatedButton(
                                  width: 100.w,
                                  height: 35.h,
                                  backgroundColor: Palette.green_5CAC00,
                                  onPressed: () {},
                                  customChild: AppText(
                                    text: context.tr("approve"),
                                    style: AppTextStyle.semiBold_13,
                                    textColor: Palette.white,
                                  )),
                              10.horizontalSpace,
                              CustomElevatedButton(
                                  width: 100.w,
                                  height: 35.h,
                                  backgroundColor: Palette.red_FF0606,
                                  onPressed: () {
                                    ViewsToolbox.showBottomSheet(
                                        context: context,
                                        height: 400.h,
                                        customWidget:
                                            RejectionReasonBottomSheet());
                                  },
                                  customChild: AppText(
                                    text: context.tr("reject"),
                                    style: AppTextStyle.semiBold_13,
                                    textColor: Palette.white,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.gery_DADADA,
                        size: 20.sp,
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
