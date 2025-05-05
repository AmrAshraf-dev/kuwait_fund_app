import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/enums/request_type_enum.dart';
import '../../domain/entities/notifications_entity.dart';
import '../widgets/loan_notification_widget.dart';
import '../widgets/normal_notification_widget.dart';
import '../widgets/response_notification_widget.dart';
import '../../../shared/widgets/no_data_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final List<NotificationsEntity> allNotifications = List.generate(
    40,
    (int index) => NotificationsEntity(
      type:
      //  index == 0
      //     ? NotificationTypeEnum.withResponse
      //     :
      //      index == 1
      //         ? NotificationTypeEnum.loan
      //         :
               NotificationTypeEnum.normal,
      date: "22 - Aug - 2024",
      title: "Profile information updated",
      description: "Your Profile information has been updated",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      hasScroll: false,
              isBackEnabled: true,

      screenTitle: context.tr("notification"),
      widget: NoDataWidget()
      
      
      // ListView.builder(
      //   cacheExtent: 1000,
      //   itemCount: allNotifications.length,
      //   itemBuilder: (context, index) {
      //     return NotificationItemWidget(notification: allNotifications[index]);
      //   },
      // ),
    );
  }
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationsEntity notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return notification.type == NotificationTypeEnum.withResponse
        ? ResponseNotificationWidget(notification: notification)
        :   NormalNotificationWidget(notification: notification);
  }
}
