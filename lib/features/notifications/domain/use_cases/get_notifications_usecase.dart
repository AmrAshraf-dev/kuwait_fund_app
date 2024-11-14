import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/notifications_request_model.dart";
import "../entities/notifications_entity.dart";
import "../repositories/notifications_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetNotificationsUseCase implements UseCase<BaseEntity<NotificationsEntity>, NotificationsRequestModel> {
    GetNotificationsUseCase ({required this.notificationsRepository});

  final NotificationsRepository notificationsRepository;


  @override
  Future<CustomResponseType<BaseEntity<NotificationsEntity>>> call(
    NotificationsRequestModel params,
  ) {
    
    
    return notificationsRepository.getNotifications(notificationsParams: params);
    
  }
}
