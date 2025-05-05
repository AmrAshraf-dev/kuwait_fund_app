import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utility/palette.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_toggle_button/toggle_button_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget(
      {super.key,
      required this.text,
      this.svgIcon,
      this.onTap,
      this.leadingText,
      this.toggleButton,
      this.withIcon = true
      });
  final String text;
  final String? svgIcon;
  final void Function()? onTap;
  final String? leadingText;
  final CustomToggleWidget? toggleButton;
  final bool? withIcon;

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
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  if(withIcon ?? true)...[
                    SizedBox(
                      width: 25.w,
                      height: 25.h,
                      child: SvgPicture.asset(
                        svgIcon ?? '',
                      ),
                    ),
                    10.horizontalSpace,
                  ],
                  AppText(
                    text: text,
                    //    textLimit: 23,
                    substringForDots: 1,
                    style: AppTextStyle.medium_14,
                    textAlign: TextAlign.center,
                    textColor: Palette.black,
                  ),
                  const Spacer(),
                  if (leadingText != null)
                    AppText(
                      text: leadingText!,
                      style: AppTextStyle.medium_14,
                      textAlign: TextAlign.center,
                      textColor: Palette.black,
                    ),
                  if (leadingText == null && toggleButton == null)
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Palette.gery_DADADA,
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
