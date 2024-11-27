import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/orders_request_model.dart";
import "../entities/orders_entity.dart";
import "../repositories/orders_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetOrdersUseCase implements UseCase<BaseEntity<OrdersEntity>, OrdersRequestModel> {
    GetOrdersUseCase ({required this.ordersRepository});

  final OrdersRepository ordersRepository;


  @override
  Future<CustomResponseType<BaseEntity<OrdersEntity>>> call(
    OrdersRequestModel params,
  ) {
    
    
    return ordersRepository.getOrders(ordersParams: params);
    
  }
}
