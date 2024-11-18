import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/screens/annual_submission_details_screen.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/date_picker_range_bottomsheet_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class SubmissionLeaveItemWidget extends StatelessWidget {
  final RequestHistory requestHistory;

  const SubmissionLeaveItemWidget({super.key, required this.requestHistory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ViewsToolbox.showBottomSheet(
            height: 1.sh - 200,
            context: context,
            widget: RangeDatePickerBottomsheetWidget(
                isReadOnly: true,
                selectedRange: DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now().add(const Duration(days: 7)),
                ),
                labelTitle: context.tr("applied_for"),
                consumedDays: 26,
                totalDays: 30));
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 21.h),
        child: Container(
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
                        text: requestHistory.date,
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
                            text: context.tr(requestHistory.status),
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
                            text: context.tr(requestHistory.type),
                            style: AppTextStyle.bold_16,
                            textColor: Palette.black,
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Assets.svg.blackCalander.svg(),
                              5.horizontalSpace,
                              AppText(
                                text:
                                    "${requestHistory.days} - ${requestHistory.date}",
                                style: AppTextStyle.medium_14,
                                textColor: Palette.black,
                              ),
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
