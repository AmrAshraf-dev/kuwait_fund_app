


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../models/request/notifications_request_model.dart';
import '../models/response/notifications_response_model.dart';
import '../../../notifications/data/data_sources/remote/notifications_remote_data_source.dart';

@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImp implements NotificationsRepository {
  NotificationsRepositoryImp({
    required this.notificationsRemoteDataSource,
  });

  final NotificationsRemoteDataSource notificationsRemoteDataSource;

  Future<CustomResponseType<BaseEntity<NotificationsModel>>> getNotifications(
      {required NotificationsRequestModel notificationsParams}) async {
    return await notificationsRemoteDataSource.getNotifications(
        notificationsRequestModel: notificationsParams);
  }
}


