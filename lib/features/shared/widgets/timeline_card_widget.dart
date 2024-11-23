import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';
import 'package:timeline_tile_plus/timeline_tile_plus.dart';

class TimeLineCard extends StatelessWidget {
  final String name;
  final String status;
  final String? date;
  final bool isFirst;
  final bool isLast;
  final String position;

  const TimeLineCard({
    super.key,
    required this.name,
    required this.status,
    this.date,
    required this.isFirst,
    required this.isLast,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
          child: TimelineTile(
            isFirst: isFirst,
            isLast: isLast,
            //   alignment: TimelineAlign.start,
            endChild: Container(
              constraints: BoxConstraints(minHeight: 130.h, maxWidth: 5),
            ),
            indicatorStyle: IndicatorStyle(
              width: 15,
              height: 20,
              indicator: Container(
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.gery_AAAAAA,
                ),
              ),
            ),
          ),
        ),
        11.horizontalSpace,
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Palette.yellow_FBD823,
                        width: 2.0,
                      ),
                    ),
                    child: Assets.svg.userCircleIcon.svg(
                      color: Palette.backgroundColorDark,
                    ),
                  ),
                  11.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: name,
                        style: AppTextStyle.bold_14,
                      ),
                      AppText(
                        text: position,
                        style: AppTextStyle.regular_14,
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          AppText(
                            text: context.tr("approval_status"),
                            style: AppTextStyle.semiBold_14,
                          ),
                          5.horizontalSpace,
                          AppText(
                            text: context.tr(status),
                            style: AppTextStyle.semiBold_14,
                            textColor: status == "Approved"
                                ? Palette.green_07BF0D
                                : Palette.red_FF0606,
                          ),
                        ],
                      ),
                      if (date != null)
                        AppText(
                          text: context.tr("approved_on") + date!,
                          style: AppTextStyle.regular_14,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
