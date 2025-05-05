import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utility/palette.dart';
import 'app_text.dart';

class LeaveDaysRowItemWidget extends StatelessWidget {
  final String title;
  final String days;

  const LeaveDaysRowItemWidget(
      {super.key, required this.title, required this.days});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: title,
            style: AppTextStyle.semiBold_14,
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
              width: 50.w,
              decoration: BoxDecoration(
                color: Palette.yellow_FBD823,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(text: days, style: AppTextStyle.bold_14,
                  textColor:  Colors.white,),
                ),
              )),
        ],
      ),
    );
  }
}
