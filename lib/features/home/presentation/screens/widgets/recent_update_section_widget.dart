import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/recent_update_card_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class RecentUpdatesSection extends StatefulWidget {
  const RecentUpdatesSection({super.key});

  @override
  State<RecentUpdatesSection> createState() => _RecentUpdatesSectionState();
}

class _RecentUpdatesSectionState extends State<RecentUpdatesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: context.tr("recent_updates"),
              style: AppTextStyle.bold_18,
            ),
            InkWell(
              onTap: () {},
              child: AppText(
                text: context.tr("view_all"),
                style: AppTextStyle.medium_14,
                textColor: Palette.blue_002A69,
              ),
            )
          ],
        ),
        16.verticalSpace,
        SizedBox(
          height: 140.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              RecentUpdateCardItem(
                title: context.tr("annual_vacation_request"),
                subtitle:
                    "${context.tr("your_request_has_been_approved_on")} 22 Dec 2021",
                day: "22",
                month: "Dec",
                year: "2021",
                onClick: () {},
              ),
              RecentUpdateCardItem(
                title: context.tr("annual_leave"),
                subtitle: context.tr("annual_leave"),
                day: "23",
                month: "Dec",
                year: "2021",
                onClick: () {},
              ),
              RecentUpdateCardItem(
                title: context.tr("annual_leave"),
                subtitle: context.tr("annual_leave"),
                day: "23",
                month: "Dec",
                year: "2021",
                onClick: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
