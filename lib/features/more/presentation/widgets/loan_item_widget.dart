import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/more/presentation/widgets/operations_loan_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/advanced_expandable_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

class LoansWidget extends StatelessWidget {
  const LoansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTitleWidget(title: context.tr('loans')),
            12.verticalSpace,
            AppText(
              text: context.tr('fund_operations_expansion'),
              style: AppTextStyle.medium_18,
            ),
            16.verticalSpace,
            AppText(
              text: context.tr("note_all_amount_are_in_kuwaiti_dinar"),
              style: AppTextStyle.medium_16,
            ),
            10.verticalSpace,
            AdvancedExpandableSection(
                headerPadding: const EdgeInsetsDirectional.only(
                    start: 20, top: 20, bottom: 20),
                customText: SizedBox(
                    width: 240.w,
                    child: MainTitleWidget(
                        title: context.tr("central_asian_european_countries"))),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Palette.grey_7B7B7B.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Palette.gery_DADADA),
                    ),
                    child: OperationsLoanItem(
                      countryName: "albania",
                      sectorNames: ["agriculture", "agriculture"],
                      amounts: ["eight_millions", "eight_millions"],
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Palette.grey_7B7B7B.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Palette.gery_DADADA),
                    ),
                    child: OperationsLoanItem(
                      countryName: "bulgaria",
                      sectorNames: ["agriculture", "agriculture"],
                      amounts: ["eight_millions", "eight_millions"],
                    ),
                  ),
                ]),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
