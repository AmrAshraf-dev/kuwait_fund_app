import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;
  final AppTextStyle? fontStyle;
  final double? indicatorWidth;
  final bool isCenter;

  const MainTitleWidget({
    super.key,
    required this.title,
    this.fontStyle,
    this.indicatorWidth,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          style: fontStyle ?? AppTextStyle.bold_18,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
        ),
        Container(
          width: indicatorWidth ?? 23.w,
          padding: EdgeInsets.only(bottom: 7),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xfffbd823),
                width: 7.0.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}
