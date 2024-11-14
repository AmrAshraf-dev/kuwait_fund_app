import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/insurance_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/expandable_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("insurance"),
      appBarHeight: 90.h,
      widget: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.verticalSpace,
                    InsuranceRowDetails(
                      title: "Gulf insurance company",
                      subtitle: "${context.tr("insurance_id")} 1234567",
                      status: context.tr("active"),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InsuranceRowDetails(
                      title: context.tr("insurance_holder_name"),
                      subtitle: "Ahmed Mohamed",
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InsuranceRowDetails(
                      title: context.tr("insurance_company"),
                      subtitle: "company name",
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InsuranceRowDetails(
                      title: context.tr("insurance_period"),
                      subtitle: context.tr("one_year"),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InsuranceRowDetails(
                      title: context.tr("plan"),
                      subtitle: context.tr("full_insurance"),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InsuranceRowDetails(
                      title: context.tr("number_of_benficiaries"),
                      subtitle: "2",
                    ),
                    30.verticalSpace,
                  ],
                )),
            12.verticalSpace,
            MainTitleWidget(title: context.tr("beneficiaries")),
            8.verticalSpace,
            ExpandableSection(
                title: "Ahmed Mohamed",
                subTitle: context.tr("spouse"),
                iconWidget: Assets.svg.male.svg(
                  height: 38.h,
                  width: 38.w,
                ),
                children: []),
            14.verticalSpace,
            ExpandableSection(
                title: "Sara Mohamed",
                subTitle: context.tr("child"),
                iconWidget: Assets.svg.female.svg(
                  height: 38.h,
                  width: 38.w,
                ),
                children: []),
            29.verticalSpace,
            CustomElevatedButton(
              radius: 10.r,
              width: 1.sw,
              onPressed: () {},
              text: context.tr("unsubscribe_insurance"),
              backgroundColor: Palette.red_FF0606,
            ),
          ],
        ),
      ),
    );
  }
}
