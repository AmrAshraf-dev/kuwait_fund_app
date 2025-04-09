import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/date_picker_range_bottomsheet_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class LeaveHistoryItemWidget extends StatelessWidget {
  final AnnualLeaveDetailsEntity annualLeaveDetailsEntity;

  const LeaveHistoryItemWidget(
      {super.key, required this.annualLeaveDetailsEntity});

  @override
  Widget build(BuildContext context) {
    DateTime parsedStartDate =
        DateTime.parse(annualLeaveDetailsEntity.startDate ?? '');

    DateTime parsedEndDate =
        DateTime.parse(annualLeaveDetailsEntity.startDate ?? '');

    DateTime parsedRequestDate =
        DateTime.parse(annualLeaveDetailsEntity.requestDate ?? '');
    //

    String formattedStartDate =
        DateFormat('dd/mm/yyyy').format(parsedStartDate);
    String formattedEndDate = DateFormat('dd/mm/yyyy').format(parsedEndDate);

    String formattedRequestDate =
        DateFormat('dd/mm/yyyy').format(parsedRequestDate);
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
                onDoneCallback: (bool isSelectedRangeValid) {},
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
                        text: formattedRequestDate,
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: _getRequestStatusColor(
                              annualLeaveDetailsEntity.leaveStatus ?? ''),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: context
                                .tr(annualLeaveDetailsEntity.leaveStatus ?? ''),
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
                            text: context
                                .tr(annualLeaveDetailsEntity.requestType ?? ''),
                            style: AppTextStyle.bold_16,
                            textColor: Palette.black,
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Assets.svg.blackCalander.svg(),
                              5.horizontalSpace,
                              AppText(
                                text: //annualLeaveDetailsEntity.endDate ?? '',
                                    "$formattedStartDate - $formattedEndDate",
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

  _getRequestStatusColor(String requestStatus) {
    switch (requestStatus) {
      case "Pending" || "قيد الانتظار":
        return Palette.orangeBackgroundTheme;
      case "Approved" || "مقبولة":
        return Palette.green;
      case "Rejected" || "ملغية":
        return Palette.redBackgroundTheme;
      default:
        return Palette.grey_7B7B7B;
    }
  }
}
