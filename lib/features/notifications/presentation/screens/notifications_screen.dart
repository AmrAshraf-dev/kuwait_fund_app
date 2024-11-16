import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kf_ess_mobile_app/core/enums/request_type_enum.dart';
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart';
import 'package:kf_ess_mobile_app/features/notifications/presentation/widgets/loan_notification_widget.dart';
import 'package:kf_ess_mobile_app/features/notifications/presentation/widgets/normal_notification_widget.dart';
import 'package:kf_ess_mobile_app/features/notifications/presentation/widgets/response_notification_widget.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final List<NotificationsEntity> allNotifications = List.generate(
    40,
    (int index) => NotificationsEntity(
      type: index == 0
          ? NotificationTypeEnum.withResponse
          : index == 1
              ? NotificationTypeEnum.loan
              : NotificationTypeEnum.normal,
      date: "22 - Aug - 2024",
      title: "Profile information updated",
      description: "Your Profile information has been updated",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("notification"),
      widget: NotificationsListViewWidget(notificationsList: allNotifications),
    );
  }
}

class NotificationsListViewWidget extends StatelessWidget {
  final List<NotificationsEntity> notificationsList;

  const NotificationsListViewWidget(
      {super.key, required this.notificationsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: notificationsList.length,
        itemBuilder: (context, index) {
          return NotificationItemWidget(notification: notificationsList[index]);
        },
      ),
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
        : notification.type == NotificationTypeEnum.loan
            ? LoanNotificationWidget(notification: notification)
            : NormalNotificationWidget(notification: notification);
  }
}
