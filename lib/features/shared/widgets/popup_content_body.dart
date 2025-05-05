import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extensions/size_extensions.dart';
import '../../../core/routes/route_sevices.dart';
import '../../../core/utility/palette.dart';
import '../../../core/utility/theme.dart';
import 'app_text.dart';
import 'custom_elevated_button_widget.dart';
 

class PopupContentBody extends StatelessWidget {
  const PopupContentBody({
    super.key,
    required this.actionsData,
    required this.message,
    required this.description,
    required this.assetPath,
    this.showActionsButtons = true,
    this.showDescription = true,
    this.closeOnlyPopup = false,
    this.continueButtonCallback,
    this.firstPopData,
    this.secondPopData,
    this.onContinueTap,
  });

  final Widget? actionsData;
  final String message;
  final String description;
  final String assetPath;
  final bool showActionsButtons;
  final bool showDescription;
  final Object? firstPopData;
  final Object? secondPopData;
  final bool closeOnlyPopup;
  final void Function()? continueButtonCallback;
  final void Function()? onContinueTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          10.heightBox,
          Center(
            child: Image.asset(
              assetPath,
              width: 110.h,
              height: 110.h,
            ),
          ),
          SizedBox(height: 40.h),
          AppText(
            text: message,
            style: AppTextStyle.semiBold_24,
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          if (showDescription)
            AppText(
              text: description,
              style: AppTextStyle.regular_20,
              textColor: AppTheme.inDarkMode(context,
                  dark: Palette.white, light: Palette.grey_626C83),
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          20.heightBox,
          if (showActionsButtons)
            Column(
              children: <Widget>[
                actionsData ??
                    CustomElevatedButton(
                        width: 300.w,
                        text: context.tr("continue"),
                        onPressed: () {
                          if (closeOnlyPopup) {
                            CustomMainRouter.pop(result: firstPopData);
                          } else {
                            CustomMainRouter.pop();
                            CustomMainRouter.pop(result: secondPopData);
                          }
                          if (continueButtonCallback != null){
                            continueButtonCallback!();

                          }
                        }),
              ],
            ),
          SizedBox(height: 70.h),
        ],
      ),
    );
  }
}
