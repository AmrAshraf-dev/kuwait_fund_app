import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_admin/admin_dept_mission/presentation/widgets/dept_mission_calendar_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class AdminDeptMissionScreen extends StatefulWidget {
  const AdminDeptMissionScreen({super.key});

  @override
  State<AdminDeptMissionScreen> createState() => _AdminDeptMissionScreenState();
}

class _AdminDeptMissionScreenState extends State<AdminDeptMissionScreen> {
  bool _isCalandarView = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("dept_mission"),
        hasScroll: false,
        isBackEnabled: false,
        
        widget: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 21.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomDropDownField<String>(
                          keyName: "deptName",
                           
                          width: 230.w,
                          labelText: context.tr("deptName"),
                          disableSearch: true,
                          disableFiled: false,
                          onChanged: (
                            String? newSelectedService,
                          ) {},
                          items: <String>[
                            'administration',
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
                            'administration',
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
                            setState(() {
                              _isCalandarView = !_isCalandarView;
                            });
                            // ViewsToolbox.showBottomSheet(
                            //     // height: 1.sh - 200,
                            //     context: context,
                            //     customWidget: SubmissionFilterBottomSheet());
                          },
                          child: Container(
                            height: 42.h,
                            width: 42.h,
                            decoration: BoxDecoration(
                              color: Palette.blue_5490EB,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _isCalandarView
                                  ? Assets.svg.calendarEye.svg()
                                  : Assets.svg.calander.svg(),
                            ),
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
                  _isCalandarView
                      ? DeptMissionCalendarSection()
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette.gery_DADADA,
                              width: 1,
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            children: [
                              20.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 41.h,
                                        width: 41.w,
                                        child: Assets.svg.arrowTarget.svg(
                                          height: 41.h,
                                          width: 41.w,
                                        ),
                                      ),
                                      AppText(
                                        text: context.tr("68"),
                                        style: AppTextStyle.bold_18,
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: AppText(
                                          textAlign: TextAlign.center,
                                          text: context
                                              .tr("total_mission_this_year"),
                                          style: AppTextStyle.regular_14,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 41.h,
                                        width: 41.w,
                                        child: Assets.svg.pepole.svg(),
                                      ),
                                      AppText(
                                        text: context.tr("26"),
                                        style: AppTextStyle.bold_18,
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: AppText(
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          text: context.tr(
                                              "number_of_employees_on_mission"),
                                          style: AppTextStyle.regular_14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 41.h,
                                        width: 41.w,
                                        child: Assets.svg.world.svg(
                                          height: 41.h,
                                          width: 41.w,
                                        ),
                                      ),
                                      AppText(
                                        text: context.tr("5"),
                                        style: AppTextStyle.bold_18,
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: AppText(
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          text:
                                              context.tr("number_of_countries"),
                                          style: AppTextStyle.regular_14,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              20.verticalSpace,
                            ],
                          ),
                        ),
                  10.verticalSpace,
                  _isCalandarView
                      ? Container()
                      : ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            MainTitleWidget(
                                title: context
                                    .tr("emoloyees_on_mission_this_year")),
                            10.verticalSpace,
                            EmployeesOnMissionWidget(),
                          ],
                        ),
                ]),
          ),
        ));
  }
}

class EmployeesOnMissionWidget extends StatelessWidget {
  EmployeesOnMissionWidget({super.key});

  final List<Map<String, String>> visits = [
    {
      'name': 'Ahmed Elsayed',
      'dept': 'administration',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'mission_count': '14'
    },
    {
      'name': 'Ahmed Al-Farsi',
      'dept': 'administration',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'mission_count': '14'
    },
    {
      'name': 'Fatima Al-Mansoori',
      'dept': 'administration',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'mission_count': '14'
    },
    {
      'name': 'Fatima Al-Mansoori',
      'dept': 'administration',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'mission_count': '15',
    },
    {
      'name': 'Fatima Al-Mansoori',
      'dept': 'administration',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'mission_count': '16',
    },
    {
      'name': 'Fatima Al-Mansoori',
      'dept': 'administration',
      'postion': 'project_director',
      'time': '10:30-AM - 12:30-PM',
      'mission_count': '16',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visits.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (conAppText, index) {
        final log = visits[index];
        return Padding(
          padding: EdgeInsets.only(top: 10.0.h),
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Palette.gery_DADADA,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
                border: Border.all(
                  color: Palette.gery_DADADA,
                  width: 1,
                ),
                color: Palette.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
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
                                width: 50.w,
                                height: 50.w,
                                color: Palette.black),
                          ),
                          5.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: log['name']!,
                                style: AppTextStyle.bold_14,
                              ),
                              AppText(
                                  style: AppTextStyle.regular_14,
                                  textColor: Colors.black,
                                  text: context.tr(log['postion']!)),
                              AppText(
                                  style: AppTextStyle.regular_14,
                                  textColor: Colors.black,
                                  text: context.tr(log['dept']!)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Palette.yellow_FBD823,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 15.w),
                                  child: AppText(
                                    text: log['mission_count']!,
                                    style: AppTextStyle.bold_18,
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              AppText(
                                text: context.tr("mission"),
                                style: AppTextStyle.regular_14,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.gray_C8C2C2,
                          )
                        ],
                      )
                    ],
                  ))),
        );
      },
    );
  }
}
