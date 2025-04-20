import 'package:easy_localization/easy_localization.dart' hide TextDirection;
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

class RequestItemWidget extends StatefulWidget {
  final RequestsEntity request;
  final RequestsCubit requestsCubit;

  RequestItemWidget({super.key, required this.request , required this.requestsCubit});

  @override
  State<RequestItemWidget> createState() => _RequestItemWidgetState();
}

class _RequestItemWidgetState extends State<RequestItemWidget> {
  final DeleteLeaveCubit deleteLeaveCubit = getIt<DeleteLeaveCubit>();

  final ExtendLeaveCubit extendLeaveCubit = getIt<ExtendLeaveCubit>();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => deleteLeaveCubit),
        BlocProvider(create: (context) => extendLeaveCubit),
      ],
      child: Container(
          height: widget.request.leaveStatus == 'Pending' ? 190.h : 150.h,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Directionality(
                         textDirection: TextDirection.ltr,
                      child: AppText(
                        text: widget.request.requestDate?.showDateWithFormat(),
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                    ),
                    if (widget.request.leaveStatus != null)
                      Container(
                        decoration: BoxDecoration(
                          color: _getRequestStatusColor(
                              widget.request.leaveStatus ?? ""),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: context.tr(widget.request.leaveStatus ?? ""),
                            textColor: Colors.white,
                            style: AppTextStyle.semiBold_12,
                          ),
                        ),
                      )
                  ],
                ),
                15.verticalSpace,
                         AppText(
                           //  text: context.tr(request.title ?? ""),
                           text: context.tr(widget.request.leaveType ?? ""),
                           style: AppTextStyle.bold_16,
                           textColor: Palette.black,
                         ),
                                         10.verticalSpace,

                        Directionality(
                              textDirection: TextDirection.ltr,
                              child: AppText(
                                text:"${widget.request.leaveStartDate} - ${widget.request.leaveEndDate}" 
                              ),
                            ),
                15.verticalSpace,
               Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           if ((widget.request.showExtendButton ?? false))
                          CustomElevatedButton(
                            onPressed: () {
                              CustomMainRouter.push(
                                 ExtendLeaveDetailsRoute(
                                      requestsEntity: widget.request));
                            },
                            text: context.tr("extend"),
                            width: 100.w,
                            height: 40.h,
                            backgroundColor: Palette.greenBackgroundTheme,
                          ),
                          if (widget.request.showCancelButton ?? false)
                            BlocConsumer<DeleteLeaveCubit, DeleteLeaveState>(
                              listener: (context, state) {
                                if (state is DeleteLeaveLoadingState) {
                                  ViewsToolbox.showLoading();
                                } else if (state is DeleteLeaveReadyState) {
                                  // To refresh requests again after deleting
                                 widget.requestsCubit.getRequests();

                                  ViewsToolbox.dismissLoading();
                                  ViewsToolbox.showMessageBottomsheet(
                                    context: context,
                                    closeOnlyPopup: true,
                                    status: ConfirmationPopupStatus.success,
                                    message: context
                                        .tr("request_canceled_successfully"),
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
                                            title: context.tr('cancel'),
                                            content:
                                                context.tr('deleteDialog'),
                                            yesText: context.tr('cancel_request'),
                                            noText: context.tr('back'),
                                            yesColor: Palette.red_FF0606 ,
                                            noColor: Palette.primaryColor);
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
                    
              ],
            ),
          )),
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
                  yesText,
                  style: TextStyle(color: yesColor),
                ),
                onPressed: () {
                  CustomMainRouter.pop();
                  deleteLeaveCubit.getDeleteLeave(
                      deleteLeaveRequestModel: DeleteLeaveRequestModel(
                    leaveRequestID:int.parse(widget.request.leaveID??"0")  ,
                  ));
                }),
            TextButton(
              child: Text(
                noText,
                style: TextStyle(color: noColor),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            ),
         
          ],
        );
      },
    );
  }
}
