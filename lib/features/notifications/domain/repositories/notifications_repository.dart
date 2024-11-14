


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/notifications_request_model.dart";
import "../entities/notifications_entity.dart";



/// Data operations for the Notifications collection
abstract class NotificationsRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< NotificationsEntity>>> getNotifications({
    required NotificationsRequestModel notificationsParams,
  });
}
