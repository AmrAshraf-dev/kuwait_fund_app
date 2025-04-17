import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/enums/request_type_enum.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/approve_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/entities/submission_entity.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/cubits/approve_leave_request_cubit/approve_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/cubits/reject_leave_request_cubit/reject_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/rejection_reason_bottomsheet.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class SubmissionItemWidget extends StatelessWidget {
  final SubmissionEntity submissionsEntity;
  final ApproveLeaveRequestCubit approveLeaveRequestCubit =
      getIt<ApproveLeaveRequestCubit>();

  final RejectLeaveRequestCubit rejectLeaveRequestCubit =
      getIt<RejectLeaveRequestCubit>();
  SubmissionItemWidget({super.key, required this.submissionsEntity});

  @override
  Widget build(BuildContext context) {
    // DateFormat('dd/MM/yyyy').format(submissionsEntity.createDate ?? DateTime.now());
    return InkWell(
      // onTap: () {
      //   if (submissionsEntity.requestType ==
      //       RequestTypeEnum.annualLeaveRequest.name) {
      //     CustomMainRouter.push(AnnualSubmissionsDetailsRoute());
      //   }
      // },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => approveLeaveRequestCubit),
          BlocProvider(create: (context) => rejectLeaveRequestCubit),
        ],
        child: Padding(
          padding:
              EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
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
                          text: submissionsEntity.createDate,
                          style: AppTextStyle.semiBold_12,
                          textColor: Palette.semiTextGrey,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Palette.orangeDark,
                        //     borderRadius: BorderRadius.circular(6.r),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: AppText(
                        //       text: context.tr(submissionsEntity.leaveStatus!),
                        //       textColor: Colors.white,
                        //       style: AppTextStyle.semiBold_12,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    11.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Assets.svg.person.svg(),
                                5.horizontalSpace,
                                AppText(
                                  text: submissionsEntity.empLoginName,
                                  // style: AppTextStyle.medium_14,
                                  style: AppTextStyle.bold_16,
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
                                      "${submissionsEntity.startDate} - ${submissionsEntity.endDate}",
                                  style: AppTextStyle.medium_14,
                                  textColor: Palette.black,
                                ),
                              ],
                            ),
                            5.verticalSpace,
                            AppText(
                              text: context.tr(submissionsEntity.leaveType!),
                              textColor: Palette.black,
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                BlocConsumer<ApproveLeaveRequestCubit,
                                        ApproveLeaveRequestState>(
                                    listener: (context, state) {
                                  if (state
                                      is ApproveLeaveRequestLoadingState) {
                                    ViewsToolbox.showLoading();
                                  } else if (state
                                      is ApproveLeaveRequestReadyState) {
                                    ViewsToolbox.dismissLoading();
                                    ViewsToolbox.showMessageBottomsheet(
                                      context: context,
                                      closeOnlyPopup: true,
                                      status: ConfirmationPopupStatus.success,
                                      message: context
                                          .tr("request_approved_successfully"),
                                    );
                                  } else if (state
                                      is ApproveLeaveRequestErrorState) {
                                    ViewsToolbox.dismissLoading();

                                    ViewsToolbox.showErrorAwesomeSnackBar(
                                        context, state.message!);
                                  }
                                }, builder: (context, state) {
                                  return CustomElevatedButton(
                                      width: 100.w,
                                      height: 35.h,
                                      backgroundColor: Palette.green_5CAC00,
                                      onPressed: () async {
                                        // ViewsToolbox.showMessageBottomsheet(
                                        //   context: context,
                                        //   status: ConfirmationPopupStatus.success,
                                        //   message: context
                                        //       .tr("request_submitted_successfully"),
                                        // );
                                        // Usage:
                                        final result =
                                            await showConfirmationDialog(
                                                context: context,
                                                title: context
                                                    .tr('approveRequest'),
                                                content: context
                                                    .tr('approveConfirmation'),
                                                yesText: context.tr('approve'),
                                                noText: context.tr('cancel'),
                                                yesColor: Palette.green_5CAC00,
                                                noColor: Palette.red_FF0606);
                                        if (result ?? false) {
                                          // User confirmed
                                        }
                                      },
                                      customChild: AppText(
                                        text: context.tr("approve"),
                                        style: AppTextStyle.semiBold_13,
                                        textColor: Palette.white,
                                      ));
                                }),
                                10.horizontalSpace,
                                BlocConsumer<RejectLeaveRequestCubit,
                                        RejectLeaveRequestState>(
                                    listener: (context, state) {
                                  if (state is RejectLeaveRequestLoadingState) {
                                    ViewsToolbox.showLoading();
                                  }
                                  if (state is RejectLeaveRequestErrorState) {
                                    ViewsToolbox.dismissLoading();

                                    ViewsToolbox.showErrorAwesomeSnackBar(
                                        context, state.message!);
                                  } else if (state
                                      is RejectLeaveRequestReadyState) {
                                    ViewsToolbox.dismissLoading();
                                    ViewsToolbox.showMessageBottomsheet(
                                      context: context,
                                      closeOnlyPopup: true,
                                      status: ConfirmationPopupStatus.success,
                                      message: context
                                          .tr("request_rejected_successfully"),
                                    );
                                  }
                                }, builder: (context, state) {
                                  return CustomElevatedButton(
                                      width: 100.w,
                                      height: 35.h,
                                      backgroundColor: Palette.red_FF0606,
                                      onPressed: ()  {
                                        ViewsToolbox.showBottomSheet(
                                            context: context,
                                            height: 400.h,
                                            customWidget:
                                                 RejectionReasonBottomSheet(
                                              submissionsEntity:
                                                  submissionsEntity,
                                              rejectLeaveRequestCubit:
                                                  rejectLeaveRequestCubit,
                                            ));
                                      },
                                      customChild: AppText(
                                        text: context.tr("reject"),
                                        style: AppTextStyle.semiBold_13,
                                        textColor: Palette.white,
                                      ));
                                })
                              ],
                            ),
                          ],
                        ),
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   color: Palette.gery_DADADA,
                        //   size: 20.sp,
                        // )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    String yesText = 'Yes',
    String noText = 'No',
    Color? yesColor,
    Color? noColor,
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(
                noText,
                style: TextStyle(color: noColor),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            TextButton(
                child: Text(
                  yesText,
                  style: TextStyle(color: yesColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  approveLeaveRequestCubit
                      .createApproveLeaveRequest(ApproveLeaveRequestModel(
                    leaveRequestID: submissionsEntity.id,
                  ));
                }),
          ],
        );
      },
    );
  }
}
