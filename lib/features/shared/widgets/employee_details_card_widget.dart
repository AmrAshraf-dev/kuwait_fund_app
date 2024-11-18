import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class EmployeeDetailsCardWidget extends StatelessWidget {
  const EmployeeDetailsCardWidget({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: context.tr("employee_details")),
        10.verticalSpace,
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Palette.blue_5490EB,
                          width: 2.0,
                        ),
                      ),
                      child: Assets.svg.userCircleIcon.svg(
                          width: 50.w,
                          height: 50.w,
                          color: Palette.backgroundColorDark),
                    ),
                    11.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: employee.name,
                          style: AppTextStyle.bold_16,
                        ),
                        AppText(
                          text: employee.position,
                          style: AppTextStyle.regular_14,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Palette.gery_DADADA,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Employee {
  final String name;
  final String position;
  final String department;
  final String email;
  final String phone;

  Employee({
    required this.name,
    required this.position,
    required this.department,
    required this.email,
    required this.phone,
  });
}
