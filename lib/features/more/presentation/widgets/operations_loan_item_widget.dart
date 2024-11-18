import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class OperationsLoanItem extends StatelessWidget {
  String? countryName;
  List<String> sectorNames;
  List<String> amounts;

  OperationsLoanItem({
    super.key,
    this.countryName,
    required this.sectorNames,
    required this.amounts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: context.tr(countryName!),
                  style: AppTextStyle.semiBold_18,
                ),
                AppText(
                  text: context.tr(amounts.first),
                  style: AppTextStyle.regular_18,
                ),
              ],
            ),
            Divider(
              color: Palette.gery_DADADA,
              thickness: 1,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(sectorNames.length, (index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: context.tr(sectorNames[index]),
                            style: AppTextStyle.semiBold_16,
                          ),
                          AppText(
                            text: context.tr(amounts[index]),
                            style: AppTextStyle.regular_16,
                          ),
                          AppText(
                            text: '39,587 KD',
                            style: AppTextStyle.regular_16,
                          ),
                        ],
                      ),
                      Divider(
                        color: Palette.gery_DADADA,
                        thickness: 1,
                      ),
                    ],
                  );
                })),
          ],
        ));
  }
}
