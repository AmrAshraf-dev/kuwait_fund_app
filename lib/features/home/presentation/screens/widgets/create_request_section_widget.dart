import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/icons.dart';
import '../../../../../core/routes/route_sevices.dart';
import '../../../../../core/routes/routes.gr.dart';
import '../../../../../core/utility/palette.dart';
import '../../../../shared/widgets/app_text.dart';
import 'create_request_card_item_widget.dart';

class CreateRequestSection extends StatefulWidget {
  const CreateRequestSection({super.key});

  @override
  State<CreateRequestSection> createState() => _CreateRequestSectionState();
}

class _CreateRequestSectionState extends State<CreateRequestSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Padding(
          padding: EdgeInsetsDirectional.only(start: 32.w, end: 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: context.tr("create_request"),
                style: AppTextStyle.bold_18,
              ),
              InkWell(
                onTap: () {
                  CustomMainRouter.push(CreateRequestRoute(
                   
                  ));
                },
                child: AppText(
                  text: context.tr("view_all"),
                  style: AppTextStyle.medium_14,
                  textColor: Palette.blue_002A69,
                ),
              )
            ],
          ),
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsetsDirectional.only(start: 28.0.w),
          child: SizedBox(
            height: 180.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                CreateRequestCardItem(
                  title: context.tr("annual_leave"),
                  svgIcon: annualLeave,
                  onClick: () {
                    CustomMainRouter.push(CreateAnnualLeaveRequestRoute());
                  },
                ),

                CreateRequestCardItem(
                  title: context.tr("emergency_leave"),
                  svgIcon: emergencyLeave,
                  onClick: () {
                    CustomMainRouter.push(CreateEmergencyLeaveRequestRoute());
                  },
                ),
                CreateRequestCardItem(
                  title: context.tr("sick_leave"),
                  svgIcon: sickLeave,
                  onClick: () {
                    CustomMainRouter.push(CreateSickLeaveRequestRoute());
                  },
                ),
                // CreateRequestCardItem(
                //   title: context.tr("training_request"),
                //   svgIcon: trainingRequest,
                //   onClick: () {
                //     CustomMainRouter.push(CreateTrainingRequestRoute());
                //   },
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
