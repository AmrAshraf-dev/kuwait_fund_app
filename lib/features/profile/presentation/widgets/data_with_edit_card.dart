import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class DataWithEditCard extends StatefulWidget {
  const DataWithEditCard({super.key ,
    required this.onPressed ,
    required this.title,
    required this.subTitle,
    required this.icon
  });

  final Function() onPressed;
  final String title;
  final String subTitle;
  final Widget icon;

  @override
  State<DataWithEditCard> createState() => _DataWithEditCardState();
}

class _DataWithEditCardState extends State<DataWithEditCard> {
  // TODO refactor this widget

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: widget.onPressed,
              child: AppText(
                text: "Edit",
                style: AppTextStyle.medium_14,
                textColor: Palette.blue_5490EB,
              ),
            ),
            Row(
              children: <Widget>[
                widget.icon,
                12.horizontalSpace,
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
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
