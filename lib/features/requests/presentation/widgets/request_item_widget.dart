import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/delete_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/delete_leave_cubit/delete_leave_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/extend_leave_cubit/extend_leave_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/request_types_cubit/requests_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';

class RequestItemWidget extends StatelessWidget {
  final RequestsEntity request;
  int? requestID;

  RequestItemWidget({super.key, required this.request, this.requestID});

  final DeleteLeaveCubit deleteLeaveCubit = getIt<DeleteLeaveCubit>();
  final ExtendLeaveCubit extendLeaveCubit = getIt<ExtendLeaveCubit>();
  final RequestsCubit requestsCubit = getIt<RequestsCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => deleteLeaveCubit),
        BlocProvider(create: (context) => extendLeaveCubit),
        BlocProvider(create: (context) => requestsCubit),
      ],
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
        child: Container(
            height: request.leaveStatus == 'Pending' ? 190.h : 150.h,
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
                        text: request.requestDate?.showDateWithFormat(),
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                      if (request.leaveStatus != null)
                        Container(
                          decoration: BoxDecoration(
                            color: _getRequestStatusColor(
                                request.leaveStatus ?? ""),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppText(
                              text: context.tr(request.leaveStatus ?? ""),
                              textColor: Colors.white,
                              style: AppTextStyle.semiBold_12,
                            ),
                          ),
                        )
                    ],
                  ),
                  11.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            //  text: context.tr(request.title ?? ""),
                            text: context.tr(request.leaveType ?? ""),
                            style: AppTextStyle.bold_16,
                            textColor: Palette.black,
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              AppText(
                                text: request.leaveStartDate != null
                                    ?
                                    //  DateFormat('yyyy-MMMM-dd').format(
                                    //     DateTime.parse(
                                    request.leaveStartDate ?? ''
                                    //)
                                    //)
                                    : '',
                              ),
                              20.horizontalSpace,
                              AppText(
                                text: request.leaveEndDate != null
                                    ?
                                    // DateFormat('yyyy-MMMM-dd').format(
                                    //     DateTime.parse(
                                    request.leaveEndDate ?? '' //))
                                    : '',
                              ),
                            ],
                          ),
                        ],
                      ),
                      // if (request.requestTypeID == "1")
                      //   Icon(
                      //     Icons.arrow_forward_ios,
                      //     color: Palette.gery_DADADA,
                      //     size: 20.sp,
                      //   )
                    ],
                  ),
                  15.verticalSpace,
                  request.leaveStatus == 'Pending'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // if (request.showExtendButton ?? false)
                            CustomElevatedButton(
                              onPressed: () {
                                //    if (int.parse(request.requestTypeID ?? "1") ==
                                //      RequestTypeEnum.annualLeaveRequest.index) {
                                CustomMainRouter.push(
                                    AnnualLeaveRequestDetailsRoute(
                                        requestsEntity: request));
                              },
                              //  },
                              text: context.tr("extend"),
                              width: 100.w,
                              height: 40.h,
                              backgroundColor: Palette.greenBackgroundTheme,
                            ),
                            if (request.showCancelButton ?? false)
                              BlocConsumer<DeleteLeaveCubit, DeleteLeaveState>(
                                listener: (context, state) {
                                  if (state is DeleteLeaveLoadingState) {
                                    ViewsToolbox.showLoading();
                                  } else if (state is DeleteLeaveReadyState) {
                                    ViewsToolbox.dismissLoading();
                                    ViewsToolbox.showMessageBottomsheet(
                                      context: context,
                                      closeOnlyPopup: true,
                                      status: ConfirmationPopupStatus.success,
                                      message: context
                                          .tr("request_deleted_successfully"),
                                    );
                                  } else if (state is DeleteLeaveErrorState) {
                                    ViewsToolbox.dismissLoading();

                                    ViewsToolbox.showErrorAwesomeSnackBar(
                                        context, state.message!);
                                  }
                                },
                                builder: (context, state) {
                                  return CustomElevatedButton(
                                    onPressed: () async {
                                      final result =
                                          await showConfirmationDialog(
                                              context: context,
                                              title: context.tr('delete'),
                                              content:
                                                  context.tr('deleteDialog'),
                                              yesText: context.tr('remove'),
                                              noText: context.tr('back'),
                                              yesColor: Palette.primaryColor,
                                              noColor: Palette.red_FF0606);
                                      if (result ?? false) {
                                        // User confirmed
                                      }
                                    },
                                    text: context.tr("cancel"),
                                    width: 100.w,
                                    height: 40.h,
                                    backgroundColor: Palette.redBackgroundTheme,
                                  );
                                },
                              )
                          ],
                        )
                      : Offstage()
                ],
              ),
            )),
      ),
    );
  }

  _getRequestStatusColor(String requestStatus) {
    switch (requestStatus) {
      case "Pending":
        return Palette.orangeBackgroundTheme;
      case "Approved":
        return Palette.green;
      case "Rejected":
        return Palette.redBackgroundTheme;
      default:
        return Palette.grey_7B7B7B;
    }
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
                  Navigator.pop(context);
                  deleteLeaveCubit.getDeleteLeave(
                      deleteLeaveRequestModel: DeleteLeaveRequestModel(
                    leaveRequestID: requestID ?? 0,
                  ));
                }),
          ],
        );
      },
    );
  }
}
