import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class AdvancedExpandableSection extends StatefulWidget {
  bool _isExpanded = false;
  final String? title;
  final String? subTitle;
  final Widget? customText;
  final List<Widget> children;
  final Widget? iconWidget;
  final EdgeInsetsGeometry? headerPadding;

  AdvancedExpandableSection(
      {super.key,
      this.title,
      required this.children,
      this.customText,
      this.iconWidget,
      this.headerPadding,
      this.subTitle});

  @override
  State<AdvancedExpandableSection> createState() =>
      _AdvancedExpandableSectionState();
}

class _AdvancedExpandableSectionState extends State<AdvancedExpandableSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        // Header
        GestureDetector(
          onTap: () {
            setState(() {
              widget._isExpanded = !widget._isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Palette.grey_7B7B7B.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              border: Border.all(color: Palette.gery_DADADA),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: widget.headerPadding ?? const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          if (widget.iconWidget != null) widget.iconWidget!,
                          if (widget.iconWidget != null) 12.horizontalSpace,
                          if (widget.customText != null) widget.customText!,
                          if (widget.customText == null && widget.title != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: widget.title,
                                  style: AppTextStyle.bold_14,
                                ),
                                5.verticalSpace,
                                AppText(
                                  text: widget.subTitle,
                                  style: AppTextStyle.regular_14,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.yellow_FBD823,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        widget._isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Palette.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Body
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            color: Palette.white_F5F4F9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(children: widget.children),
            ),
          ),
          crossFadeState: widget._isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
