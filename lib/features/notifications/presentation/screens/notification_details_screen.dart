import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key , required this.notification});

  final NotificationsEntity notification;
  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("notification"),
        isBackEnabled: true,
        widget: Container(
            height: 590.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
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
                  12.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: widget.notification.title,
                        style: AppTextStyle.bold_16,
                        textColor: Palette.black,
                      ),
                      5.verticalSpace,
                      AppText(
                        text: widget.notification.description,
                        style:AppTextStyle.medium_14,
                        textColor: Palette.black_2A2A2A,
                        lineHeight: 1,
                      ),
                    ],
                  ),
                ],
              ),
            )),
    );
  }
}
