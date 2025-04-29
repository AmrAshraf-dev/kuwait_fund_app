import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/pdf_bottomsheet_widget/pdf_bottom_sheet.dart';

class  RequestDetailsRowWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? status;
  final String? pdfUrl;
  final bool isLast;
  final bool isFirst;
  final bool isLTR;

  const  RequestDetailsRowWidget(
      {super.key,
      required this.title,
      this.subtitle,
      this.status,
      this.pdfUrl,
      this.isFirst = false,
      this.isLast = false,
      this.isLTR = false});

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
          Directionality(
            textDirection: isLTR ? TextDirection.ltr :
            
            LanguageHelper.isAr(context)? TextDirection.rtl : TextDirection.ltr,
            child: AppText(text: subtitle, style: AppTextStyle.medium_14)),
          if (!isLast)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Divider(
                thickness: 1,
              ),
            ),
          5.verticalSpace,
          if (pdfUrl != null)
            Padding(
              padding: EdgeInsets.only(top: 10.0.h),
              child: Row(
                children: [
                  Icon(
                    Icons.attach_file,
                    color: Palette.blue_0C4192,
                    size: 20.sp,
                  ),
                  5.horizontalSpace,
                  Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: ("fileName.pdf"),
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showPDFBottomSheet(
                                context,
                                'assets/pdf/sample-local-pdf.pdf',
                                bottomSheetHeight: 300,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
