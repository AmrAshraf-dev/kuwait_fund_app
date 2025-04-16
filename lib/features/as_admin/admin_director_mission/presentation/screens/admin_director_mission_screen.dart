import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/calendar_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class AdminDirectorMissionScreen extends StatefulWidget {
  const AdminDirectorMissionScreen({super.key});

  @override
  State<AdminDirectorMissionScreen> createState() =>
      _AdminDirectorMissionScreenState();
}

class _AdminDirectorMissionScreenState
    extends State<AdminDirectorMissionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("director_mission"),
        isBackEnabled: false,
        widget: Column(
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDropDownField<String>(
                    keyName: "directorName",
                     width: 250.w,
                    labelText: context.tr("directorName"),
                    disableSearch: true,
                    disableFiled: false,
                    onChanged: (
                      String? newSelectedService,
                    ) {},
                    items: <String>[
                      'Omar Farid',
                    ].map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: AppText(
                          text: item,
                          style: AppTextStyle.medium_18,
                        ),
                      );
                    }).toList(),
                    itemsSearchable: <String>[
                      'Omar Farid',
                    ]
                        .map(
                          (String item) => <String, String>{
                            item: item,
                          },
                        )
                        .toList(),
                    validator: (String? value) =>
                        AppValidator.validatorRequired(
                      value,
                      context,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ViewsToolbox.showBottomSheet(
                      //     // height: 1.sh - 200,
                      //     context: context,
                      //     customWidget: SubmissionFilterBottomSheet());
                    },
                    child: Container(
                      height: 42.h,
                      width: 42.h,
                      decoration: BoxDecoration(
                        color: Palette.yellow_FBD823,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Assets.svg.filterIcon.svg(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CalendarSectionWidget(
                customChildWidget: Padding(
                  padding: const EdgeInsets.all(4.0),
                ),
              ),
            ),
            30.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                Row(children: [
                  Container(
                    height: 14.h,
                    width: 14.h,
                    decoration: BoxDecoration(
                      color: Palette.green_457403,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: context.tr("mission"),
                    style: AppTextStyle.medium_18,
                  ),
                ]),
                20.horizontalSpace,
                Row(children: [
                  Container(
                    height: 14.h,
                    width: 14.h,
                    decoration: BoxDecoration(
                      color: Palette.orange_FFB162,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: context.tr("leave"),
                    style: AppTextStyle.medium_18,
                  ),
                ]),
              ],
            ),
          ],
        ));
  }
}
