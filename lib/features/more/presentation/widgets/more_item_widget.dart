import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utility/palette.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_toggle_button/toggle_button_widget.dart';

class MoreItemWidget extends StatelessWidget {
  const MoreItemWidget(
      {super.key,
      required this.text,
      required this.svgIcon,
      this.onTap,
      this.leadingText,
      this.toggleButton});
  final String text;
  final String svgIcon;
  final void Function()? onTap;
  final String? leadingText;
  final CustomToggleWidget? toggleButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.h),
      child: SizedBox(
        height: 60.h,
        child: Card(
          color: Palette.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Palette.gery_DADADA, width: 0.5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            splashColor: Palette.primaryColor.withOpacity(0.15),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    svgIcon,
                    width: 42.w,
                    height: 42.h,
                      //   color: Palette.primaryColor,
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: text,
                    maxLines: 2,
                    //    textLimit: 23,
                    substringForDots: 1,
                    style: AppTextStyle.medium_14,
                    textAlign: TextAlign.center,
                    textColor: Palette.black,
                  ),
                  const Spacer(),
                  if (leadingText != null)
                    Padding(
                      padding:   EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppText(
                        maxLines: 2,
                        text: leadingText!,
                        style: AppTextStyle.medium_14,
                        textAlign: TextAlign.center,
                        textColor: Palette.black,
                      ),
                    ),
                  if (leadingText == null && toggleButton == null)
                    Padding(
                      padding:   EdgeInsets.symmetric(horizontal: 10.w),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.gery_DADADA,
                      ),
                    ),
                  if (toggleButton != null) toggleButton!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
