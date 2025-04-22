
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/helper/general_helper.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

import '../../../../../../gen/assets.gen.dart';

class DirectorAppBarWidget extends StatelessWidget {
  const DirectorAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // profile photo image widget
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Palette.blue_5490EB,
                  width: 2.0,
                ),
              ),
              child: Assets.svg.userCircleIcon
                  .svg(width: 50.w, height: 50.w, color: Palette.white),
            ),
            12.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text:
                   "${context.tr('hi')} ${GeneralHelper.getWelcomeMessage(context)}",
        
                  style: AppTextStyle.regular_16,
                  textColor: Colors.white,
                ),
                5.verticalSpace,
                SizedBox(
                  width: 150.w,
                  child: AppText(
                    text: LocalData.getUser()?.userInfo.name,
                    style: AppTextStyle.bold_16,
                    textColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Container(
                height: 38.h,
                width: 38.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(chatbot),
                )),
            17.horizontalSpace,
            InkWell(
              onTap: () => CustomMainRouter.push(NotificationsRoute()),
              child: Badge(
                padding: EdgeInsets.all(1),
                backgroundColor: Palette.red_FF0606,
                label: SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: Center(
                    child: AppText(
                      text: '3',
                      style: AppTextStyle.bold_12,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                child: Container(
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SvgPicture.asset(notification),
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
