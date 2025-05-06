import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utility/palette.dart';
import 'app_text.dart';

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
          maxLines: 3,
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
                color: Palette.darkOrange_E09948,
                width: 7.0.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}
