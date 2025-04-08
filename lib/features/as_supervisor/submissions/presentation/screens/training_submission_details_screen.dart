import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/screens/annual_submission_details_screen.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/rejection_reason_bottomsheet.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/submission_leave_item_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/training_request_details_row_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/advanced_expandable_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/employee_details_card_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/timeline_card_widget.dart';

@RoutePage()
class TrainingSubmissionsDetailsScreen extends StatelessWidget {
  TrainingSubmissionsDetailsScreen({super.key});
  List<RequestHistory> requestHistory = [
    RequestHistory(
      type: "Training Request",
      date: "01/01/2021",
      status: "approved",
      days: "4",
    ),
    RequestHistory(
      type: "Training Request",
      date: "01/01/2021",
      status: "approved",
      days: "4",
    ),
    RequestHistory(
      type: "Training Request",
      date: "01/01/2021",
      status: "approved",
      days: "4",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage5,
        appBarHeight: 100.h,
        isBackEnabled: true,
        screenTitle: context.tr("training_request"),
        widget: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              20.verticalSpace,
              MainTitleWidget(
                title: context.tr("request_details"),
              ),
              13.verticalSpace,
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
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Palette.white_F7F7F7,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          5.verticalSpace,
                          TrainingRequestDetailsRowWidget(
                            isFirst: true,
                            title: "22-Aug-2024",
                            subtitle: context.tr("pending"),
                          ),
                          TrainingRequestDetailsRowWidget(
                            title: context.tr("course_type"),
                            subtitle: context.tr("external"),
                          ),
                          TrainingRequestDetailsRowWidget(
                            title: context.tr("course_location"),
                            subtitle: context.tr("Riyadh"),
                          ),
                          TrainingRequestDetailsRowWidget(
                            title: context.tr("from_date_time"),
                            subtitle: "2/Jan/2025",
                          ),
                          TrainingRequestDetailsRowWidget(
                            title: context.tr("to_date_time"),
                            subtitle: "4/Jan/2025",
                          ),
                          TrainingRequestDetailsRowWidget(
                            title: context.tr("training_goals"),
                            subtitle: "goals",
                            pdfUrl: "Course Name",
                            isLast: true,
                          ),
                        ]),
                  )),
              20.verticalSpace,
              EmployeeDetailsCardWidget(
                employee: Employee(
                  phone: "",
                  name: "Ahmed Mohamed",
                  position: "Software Engineer",
                  department: "IT",
                  email: "",
                ),
              ),
              20.verticalSpace,
              MainTitleWidget(
                title: context.tr("track_request"),
              ),
              ApprovalTimeline(),
              20.verticalSpace,
              AdvancedExpandableSection(
                headerPadding: const EdgeInsetsDirectional.only(
                    start: 20, top: 20, bottom: 20),
                customText: SizedBox(
                    width: 240.w,
                    child: MainTitleWidget(
                        title: context.tr("training_request_history"))),
                children: requestHistory.map((RequestHistory requestHistory) {
                  return SubmissionLeaveItemWidget(
                    requestHistory: requestHistory,
                  );
                }).toList(),
              ),
              40.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      width: 175.w,
                      height: 70.h,
                      backgroundColor: Palette.green_5CAC00,
                      onPressed: () {},
                      customChild: AppText(
                        text: context.tr("approve"),
                        style: AppTextStyle.semiBold_13,
                        textColor: Palette.white,
                      )),
                  10.horizontalSpace,
                  CustomElevatedButton(
                      width: 175.w,
                      height: 70.h,
                      backgroundColor: Palette.red_FF0606,
                      onPressed: () {
                        ViewsToolbox.showBottomSheet(
                            context: context,
                            height: 400.h,
                            customWidget: RejectionReasonBottomSheet());
                      },
                      customChild: AppText(
                        text: context.tr("reject"),
                        style: AppTextStyle.semiBold_13,
                        textColor: Palette.white,
                      ))
                ],
              ),
              30.verticalSpace,
              Center(
                child: CustomElevatedButton(
                    width: 200.w,
                    height: 50.h,
                    backgroundColor: Palette.transparntColor,
                    onPressed: () {
                      CustomMainRouter.pop();
                    },
                    customChild: AppText(
                      text: context.tr("cancel"),
                      textColor: Palette.blue_5490EB,
                      fontSize: 18.sp,
                    )),
              ),
            ])));
  }
}

class ApprovalTimeline extends StatelessWidget {
  const ApprovalTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        TimeLineCard(
          name: "Ahmed Al-Rashid",
          position: "Supervisor",
          status: "Approved",
          date: "22/Oct/2024",
          isFirst: true,
          isLast: false,
        ),
        TimeLineCard(
          name: "Ahmed Al-Rashid",
          position: "Supervisor",
          status: "Approved",
          date: "22/Oct/2024",
          isFirst: false,
          isLast: false,
        ),
        TimeLineCard(
          name: "Ahmed Al-Rashid",
          position: "Supervisor",
          status: "Approved",
          date: "22/Oct/2024",
          isFirst: false,
          isLast: true,
        ),
      ],
    );
  }
}
