import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/pdf_bottomsheet_widget/pdf_bottom_sheet.dart';

class RequestDetailsRowWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? status;
  final String? pdfUrl;
  final bool isLast;
  final bool isFirst;
final void Function() chooseDateCallback;
  const RequestDetailsRowWidget(
      {super.key,
      required this.title,
      this.subtitle,
      this.status,
      this.pdfUrl,
      this.isFirst = false,
      this.isLast = false, required  this.chooseDateCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isFirst
              ? AppText(
                  text: title,
                  style: AppTextStyle.semiBold_12,
                  textColor: Palette.semiTextGrey,
                )
              : AppText(
                  text: title,
                  style: AppTextStyle.semiBold_14,
                ),
          SizedBox(
            height: 5.h,
          ),

          subtitle!= null?
          AppText(text: subtitle, style: AppTextStyle.medium_14):
           CustomElevatedButton(
                              onPressed: chooseDateCallback,
                              text: context.tr("extend"),
                              width: 100.w,
                              height: 40.h,
                              backgroundColor: Palette.greenBackgroundTheme,
                            ),
          if (!isLast)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Divider(
                thickness: 1,
              ),
            ),
         
        ],
      ),
    );
  }
}
