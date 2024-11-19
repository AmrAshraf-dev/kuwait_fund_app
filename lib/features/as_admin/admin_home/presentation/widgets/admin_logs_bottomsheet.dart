import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class AdminLogsBottomSheet extends StatefulWidget {
  const AdminLogsBottomSheet({super.key});

  @override
  _AdminLogsBottomSheetState createState() => _AdminLogsBottomSheetState();
}

class _AdminLogsBottomSheetState extends State<AdminLogsBottomSheet> {
  final List<String> dates = ['14', '15', '16', '20', '21', '24'];
  String selectedDate = '14';

  final List<Map<String, String>> visits = [
    {
      'name': 'Ahmed Elsayed',
      'type': 'on_mission',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'date': '14'
    },
    {
      'name': 'Ahmed Al-Farsi',
      'type': 'on_leave',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'date': '14'
    },
    {
      'name': 'Fatima Al-Mansoori',
      'type': 'on_leave',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'date': '14'
    },
    {
      'name': 'Fatima Al-Mansoori',
      'type': 'on_mission',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'date': '15',
    },
    {
      'name': 'Fatima Al-Mansoori',
      'type': 'on_leave',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'date': '16',
    },
    {
      'name': 'Fatima Al-Mansoori',
      'type': 'on_leave',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'date': '16',
    },
  ];

  @override
  Widget build(BuildContext conAppText) {
    List<Map<String, String>> filtredLogs =
        visits.where((visit) => visit['date'] == selectedDate).toList();

    return Container(
      padding: EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          AppText(
            text: 'October 2024',
            style: AppTextStyle.bold_21,
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dates.map((date) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedDate == date ? Colors.yellow : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: selectedDate == date
                            ? Colors.transparent
                            : Palette.gery_DADADA),
                  ),
                  child: AppText(
                    text: date,
                    // style: AppTextStyle(
                    //   fontWeight: FontWeight.bold,
                    //   color: selectedDate == date ? Colors.black : Colors.grey,
                    // ),
                  ),
                ),
              );
            }).toList(),
          ),
          16.verticalSpace,
          Flexible(
            child: ListView.builder(
              itemCount: filtredLogs.length,
              shrinkWrap: true,
              itemBuilder: (conAppText, index) {
                final log = filtredLogs[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Palette.grey_7B7B7B.withOpacity(0.3),
                          blurRadius: 10.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          width: 35.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Palette.yellow_FBD823,
                              width: 2.0,
                            ),
                          ),
                          child: Assets.svg.userCircleIcon.svg(
                              width: 50.w, height: 50.w, color: Palette.black),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: log['name']!,
                              style: AppTextStyle.bold_14,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: log['type'] == "on_mission"
                                    ? Palette.blue_3542B9
                                    : Palette.blue_5490EB,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: AppText(
                                text: context.tr(log['type']!),
                                style: AppTextStyle.semiBold_12,
                                textColor: Colors.white,
                                // style: AppTextStyle(
                                //   color: Colors.white,
                                //   fontWeight: FontWeight.bold,
                                //   fontSize: 12,
                                // ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.verticalSpace,
                                AppText(
                                    style: AppTextStyle.regular_14,
                                    textColor: Colors.black,
                                    text: context.tr(log['postion']!)),
                                AppText(
                                    style: AppTextStyle.regular_14,
                                    textColor: Colors.black,
                                    text:
                                        '${log['date']}-Oct-2024 ${log['time']}'),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Palette.grey_D4CDCD,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          16.verticalSpace,
          CustomElevatedButton(
              backgroundColor: Colors.transparent,
              onPressed: () => Navigator.pop(conAppText),
              text: context.tr("colose")),
        ],
      ),
    );
  }
}
