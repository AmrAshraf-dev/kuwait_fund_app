import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class CreateRequestCardItem extends StatelessWidget {
  final String title;
  final String svgIcon;
  final void Function()? onClick;

  const CreateRequestCardItem({
    super.key,
    required this.title,
    required this.svgIcon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          end: 15.0.w, top: 5.0.h, bottom: 10.0.h, start: 5.w),
      child: SizedBox(
        width: 122.w,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Palette.grey_7B7B7B.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            color: Palette.white,
            border: Border.all(
              color: Palette.grey_D4CDCD,
              width: 0.50,
            ),
            borderRadius: BorderRadius.circular(25.0.r),
          ),
          child: GestureDetector(
            onTap: onClick,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  26.verticalSpace,
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 3.0.w),
                    child: SvgPicture.asset(
                      svgIcon,
                      color: Palette.blue_083983,
                    ),
                  ),
                  9.verticalSpace,
                  AppText(
                    text: title,
                    style: AppTextStyle.bold_15,
                    textColor: Palette.blue_083983,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: Palette.blue_083983,
                    size: 30,
                  ),
                  15.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
