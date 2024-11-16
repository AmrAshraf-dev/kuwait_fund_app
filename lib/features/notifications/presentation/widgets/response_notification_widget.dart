import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class ResponseNotificationWidget extends StatelessWidget {
  const ResponseNotificationWidget({super.key , required this.notification});

  final NotificationsEntity notification;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomMainRouter.push(NotificationDetailsRoute(notification: notification));
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 14.w, end: 15.w, top: 14.h),
        child: Container(
            height: 171.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Palette.grey_7B7B7B.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
              color: Palette.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: notification.date,
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                      Container(
                        height: 20.h,
                        width: 68.w,
                        decoration: BoxDecoration(
                          color: Palette.notificationOrange,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: AppText(
                            text: 'Pending',
                            textColor: Colors.white,
                            style: AppTextStyle.semiBold_12,
                          ),
                        ),
                      )
                    ],
                  ),
                  AppText(
                    text: 'Annual Leave Request',
                    style: AppTextStyle.bold_16,
                    textColor: Palette.black,
                  ),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Assets.svg.notificationUser.svg(),
                              6.horizontalSpace,
                              AppText(
                                text: 'Abdul Rahmen',
                                style: AppTextStyle.medium_14,
                                textColor: Palette.black_2A2A2A,
                              ),
                            ],
                          ),
                          6.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Assets.svg.notificationDate.svg(),
                              6.horizontalSpace,
                              AppText(
                                text: '(26/30) Days',
                                style: AppTextStyle.medium_14,
                                textColor: Palette.black_2A2A2A,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.gery_DADADA,
                        size: 20.sp,
                      )
                    ],
                  ),
                  14.verticalSpace,
                  Row(
                    children: [
                      CustomElevatedButton(
                        onPressed: () {},
                        text: context.tr('approve'),
                        backgroundColor: Palette.green_07BF0D,
                        width: 100.w,
                        height: 35.h,
                        textStyle: AppTextStyle.medium_14,
                        radius: 9.r,
                      ),
                      18.horizontalSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        text: context.tr('reject'),
                        backgroundColor: Palette.red_FF0606,
                        width: 100.w,
                        height: 35.h,
                        textStyle: AppTextStyle.medium_14,
                        radius: 9.r,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}