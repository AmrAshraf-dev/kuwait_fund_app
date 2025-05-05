import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/view_toolbox.dart';
import '../../../../../core/routes/route_sevices.dart';
import '../../../../../core/utility/palette.dart';
import '../../data/models/request/approve_leave_request_model.dart';
import '../../domain/entities/submission_entity.dart';
import '../cubits/approve_leave_request_cubit/approve_leave_request_cubit.dart';
import '../cubits/reject_leave_request_cubit/reject_leave_request_cubit.dart';
import 'rejection_reason_bottomsheet.dart';
import '../../../../di/dependency_init.dart';
import '../../../../shared/widgets/app_text.dart';
import '../../../../shared/widgets/confirmation_popup_content_body.dart';
import '../../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../../../gen/assets.gen.dart';

class SubmissionItemWidget extends StatefulWidget {
  final SubmissionEntity submissionsEntity;

  SubmissionItemWidget({super.key, required this.submissionsEntity});

  @override
  State<SubmissionItemWidget> createState() => _SubmissionItemWidgetState();
}

class _SubmissionItemWidgetState extends State<SubmissionItemWidget> {
  final ApproveLeaveRequestCubit approveLeaveRequestCubit =
      getIt<ApproveLeaveRequestCubit>();

  final RejectLeaveRequestCubit rejectLeaveRequestCubit =
      getIt<RejectLeaveRequestCubit>();

  @override
  Widget build(BuildContext context) {
    // DateFormat('dd/MM/yyyy').format(submissionsEntity.createDate ?? DateTime.now());
    return MultiBlocProvider(
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
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: AppText(
                          text: widget.submissionsEntity.createDate,
                          style: AppTextStyle.semiBold_12,
                          textColor: Palette.semiTextGrey,
                        ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:  MainAxisSize.max,
                     children: [
                      Row(
                        children: [
                          Assets.svg.person.svg(),
                          5.horizontalSpace,
                          AppText(
                            text: widget.submissionsEntity.empLoginName,
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
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: AppText(
                              text:
                                  "${widget.submissionsEntity.startDate} - ${widget.submissionsEntity.endDate}",
                              style: AppTextStyle.medium_14,
                              textColor: Palette.black,
                            ),
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      AppText(
                        text: context.tr(widget.submissionsEntity.leaveType!),
                        textColor: Palette.black,
                      ),
                      10.verticalSpace,
                      Center(
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          crossAxisAlignment:  CrossAxisAlignment.center,
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
                                             actionsData:   CustomElevatedButton(
                    width: 300.w,
                       text: context.tr("continue"),
                      onPressed: () {
                        // issue
                     Navigator.pop(context); 
                   }), 
                                  status: ConfirmationPopupStatus.success,
                                  message: context
                                      .tr("request_approved_successfully"),
                                );
                              } else if (state
                                  is ApproveLeaveRequestErrorState) {
                                ViewsToolbox.dismissLoading();
                            
                                ViewsToolbox.showErrorAwesomeSnackBar(
                                    context, context.tr(state.message!));
                              }
                            }, builder: (context, state) {
                              return CustomElevatedButton(
                                  width: 100.w,
                                  height: 35.h,
                                  backgroundColor: Palette.green_5CAC00,
                                  onPressed: () async {

                                          ViewsToolbox.showMessageBottomsheetConfirmation(
                                      context,
                                     message: context.tr("approveConfirmation"),
                                     onConfirm: () {
                                      Navigator.pop(context);
             
                  approveLeaveRequestCubit
                      .createApproveLeaveRequest(ApproveLeaveRequestModel(
                    leaveRequestID: widget.submissionsEntity.id,
                  ));
                                     },
                                  
                                    );
                                    
                                
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
                                    context, context.tr(state.message!));
                              } else if (state
                                  is RejectLeaveRequestReadyState) {
                                ViewsToolbox.dismissLoading();
                                ViewsToolbox.showMessageBottomsheet(
                                  context: context,
                               
                                actionsData:   CustomElevatedButton(
                    width: 300.w,
                       text: context.tr("continue"),
                      onPressed: () {
                         Navigator.pop(context);
                   }),          
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

                                         customWidget:
                                             RejectionReasonBottomSheet(
                                          submissionsEntity:
                                              widget.submissionsEntity,
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
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
 
   
}
