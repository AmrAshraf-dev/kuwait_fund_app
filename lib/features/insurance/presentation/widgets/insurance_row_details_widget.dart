import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class InsuranceRowDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? status;

  const InsuranceRowDetails(
      {super.key, required this.title, required this.subtitle, this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            style:
                status != null ? AppTextStyle.bold_18 : AppTextStyle.medium_14,
          ),
          SizedBox(
            height: 5.h,
          ),
          AppText(text: subtitle, style: AppTextStyle.semiBold_15),
          if (status != null)
            Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Container(
                    decoration: BoxDecoration(
                        color: status == "Active"
                            ? Palette.green_07BF0D
                            : Palette.red_FF0606,
                        borderRadius: BorderRadius.circular(5.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    child: AppText(
                        text: status!,
                        style: AppTextStyle.semiBold_12,
                        textColor: Colors.white))),
        ],
      ),
    );
  }
}
