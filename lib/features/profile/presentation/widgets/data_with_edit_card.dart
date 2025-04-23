import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class DataWithEditCard extends StatefulWidget {
  const DataWithEditCard(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.subTitle,
      this.subTitle2,
      required this.icon,
      this.withArrow,
      this.withEdit});

  final Function() onPressed;
  final String title;
  final String subTitle;
  final String? subTitle2;
  final Widget icon;
  final bool? withArrow;
  final bool? withEdit;

  @override
  State<DataWithEditCard> createState() => _DataWithEditCardState();
}

class _DataWithEditCardState extends State<DataWithEditCard> {
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
            // InkWell(
            //   onTap: widget.onPressed,
            //   child: AppText(
            //     text: widget.withEdit ?? true ? context.tr("edit") : "",
            //     style: AppTextStyle.medium_14,
            //     textColor: Palette.blue_5490EB,
            //   ),
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.icon,
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 205.w,
                      child: AppText(
                        text: widget.title,
                        style: AppTextStyle.bold_14,
                      ),
                    ),
                    5.verticalSpace,
                    AppText(
                      text: widget.subTitle,
                      style: AppTextStyle.regular_14,
                    ),
                    if (widget.subTitle2 != null) ...[
                      AppText(
                        text: widget.subTitle2,
                        style: AppTextStyle.regular_14,
                      ),
                    ]
                  ],
                ),
                if (widget.withArrow ?? false) ...[
                  Spacer(),
                  //  Padding(
                  //   padding: EdgeInsets.only(top: 17.w),
                  //   child: Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: Palette.gery_DADADA,
                  //     size: 20.sp,
                  //   ),
                  // )
                ]
              ],
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
