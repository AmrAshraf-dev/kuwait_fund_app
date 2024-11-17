import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/core/utility/theme.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class ExpandableSection extends StatelessWidget {
  const ExpandableSection(
      {super.key,
        this.title,
      required this.children,
      this.customText,
      this.iconWidget,
      this.headerPadding,
      this.subTitle});
  final String? title;
  final String? subTitle;
  final Widget? customText;
  final List<Widget> children;
  final Widget? iconWidget;
  final EdgeInsetsGeometry? headerPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Palette.grey_7B7B7B.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        border: Border.all(color: Palette.gery_DADADA),
      ),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconSize: 30.sp,
            iconPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            iconColor: AppTheme.inDarkMode(context,
                light: Palette.gery_DADADA, dark: Colors.white)),
        header: Padding(
          padding: headerPadding ?? const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: [
                    if (iconWidget != null) iconWidget!,
                    if (iconWidget != null) 12.horizontalSpace,
                    if (customText != null) customText!,
                    if (customText == null && title != null)
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: title,
                          style: AppTextStyle.bold_14,
                        ),
                        5.verticalSpace,
                        AppText(
                          text: subTitle,
                          style: AppTextStyle.regular_14,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: children),
        ),
      ),
    );
  }
}
