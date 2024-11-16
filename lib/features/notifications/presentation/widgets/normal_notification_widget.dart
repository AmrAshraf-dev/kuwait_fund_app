import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class NormalNotificationWidget extends StatefulWidget {
  const NormalNotificationWidget({super.key , required this.notification});

  final NotificationsEntity notification;

  @override
  State<NormalNotificationWidget> createState() => _NormalNotificationWidgetState();
}

class _NormalNotificationWidgetState extends State<NormalNotificationWidget> {

  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CustomMainRouter.push(NotificationDetailsRoute(notification: widget.notification));
        setState(() {
          isRead = true;
        });
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 14.w, end: 15.w, top: 14.h),
        child: Container(
            height: 120.h,
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
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: widget.notification.date,
                    style: AppTextStyle.semiBold_12,
                    textColor: Palette.semiTextGrey,
                  ),
                  11.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: widget.notification.title,
                              style: isRead ? AppTextStyle.regular_16 : AppTextStyle.bold_16,
                              textColor: Palette.black,
                            ),
                            5.verticalSpace,
                            AppText(
                              text: widget.notification.description,
                              style: isRead ? AppTextStyle.regular_14:AppTextStyle.medium_14,
                              textColor: Palette.black_2A2A2A,
                              lineHeight: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 22.h),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Palette.gery_DADADA,
                          size: 20.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
