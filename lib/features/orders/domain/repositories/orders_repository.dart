


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/orders_request_model.dart";
import "../entities/orders_entity.dart";



/// Data operations for the Orders collection
abstract class OrdersRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< OrdersEntity>>> getOrders({
    required OrdersRequestModel ordersParams,
  });
}
