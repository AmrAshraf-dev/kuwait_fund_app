import 'package:auto_route/auto_route.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_bottomsheet.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class VisitorsLogsScreen extends StatefulWidget {
  const VisitorsLogsScreen({super.key});

  @override
  State<VisitorsLogsScreen> createState() => _VisitorsLogsScreenState();
}

class _VisitorsLogsScreenState extends State<VisitorsLogsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("visitors_logs"),
      isBackEnabled: true,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDropDownField<String>(
                  keyName: "hostName",
                  height: 42.h,
                  width: 250.w,
                  labelText: context.tr("host_name"),
                  disableSearch: true,
                  disableFiled: false,
                  onChanged: (
                    String? newSelectedService,
                  ) {},
                  items: <String>[
                    'Accounts Department',
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
                    'Accounts Department',
                  ]
                      .map(
                        (String item) => <String, String>{
                          item: item,
                        },
                      )
                      .toList(),
                  validator: (String? value) => AppValidator.validatorRequired(
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
            child: Container(
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
              child: InkWell(
                onTap: () {
                  ViewsToolbox.showBottomSheet(
                    height: 400.h,
                    context: context,
                    customWidget: VisitsBottomSheet(),
                  );
                },
                child: AbsorbPointer(
                  absorbing: true,
                  child: RangeDatePicker(
                    maxDate: DateTime.now().add(Duration(days: 365)),
                    minDate: DateTime.now(),
                    // selectedRange:
                    //     DateTimeRange(start: DateTime(2022), end: Dat(2023)),
                    selectedCellsDecoration: BoxDecoration(
                      color: Palette.blue_ECEEF4,
                      //   shape: BoxShape.circle,
                    ),
                    selectedCellsTextStyle: TextStyle(
                        color: Palette.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                    // singleSelectedCellTextStyle: const TextStyle(),

                    singleSelectedCellDecoration: BoxDecoration(
                      color: Palette.blue_3542B9,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    currentDateDecoration: BoxDecoration(
                      color: Palette.geryPattern,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    currentDateTextStyle:
                        TextStyle(color: Palette.black, fontSize: 16.sp),
                    // daysOfTheWeekTextStyle: const TextStyle(),
                    // disabledCellsTextStyle: const TextStyle(),
                    // enabledCellsDecoration: const BoxDecoration(),
                    // enabledCellsTextStyle: const TextStyle(),
                    initialPickerType: PickerType.days,
                    leadingDateTextStyle: const TextStyle(
                        color: Palette.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    slidersColor: Palette.primaryColor.withOpacity(0.2),
                    highlightColor: Colors.redAccent,
                    slidersSize: 20,
                    //splashColor: Colors.lightBlueAccent,
                    splashRadius: 20,
                    centerLeadingDate: false,

                    onRangeSelected: (DateTimeRange? value) {},
                  ),
                ),
              ),
            ),
          ),
          30.verticalSpace,
          Row(
            children: [
              10.horizontalSpace,
              Row(children: [
                Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: Palette.blue_3542B9,
                    shape: BoxShape.rectangle,
                  ),
                ),
                10.horizontalSpace,
                AppText(
                  text: context.tr("private_visit"),
                  style: AppTextStyle.medium_18,
                ),
              ]),
              20.horizontalSpace,
              Row(children: [
                Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: Palette.blue_5490EB,
                    shape: BoxShape.rectangle,
                  ),
                ),
                10.horizontalSpace,
                AppText(
                  text: context.tr("official_visit"),
                  style: AppTextStyle.medium_18,
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
