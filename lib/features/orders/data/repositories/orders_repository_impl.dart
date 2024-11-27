


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../models/request/orders_request_model.dart';
import '../models/response/orders_response_model.dart';
import '../../../orders/data/data_sources/remote/orders_remote_data_source.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImp implements OrdersRepository {
  OrdersRepositoryImp({
    required this.ordersRemoteDataSource,
  });

  final OrdersRemoteDataSource ordersRemoteDataSource;

  Future<CustomResponseType<BaseEntity<OrdersModel>>> getOrders(
      {required OrdersRequestModel ordersParams}) async {
    return await ordersRemoteDataSource.getOrders(
        ordersRequestModel: ordersParams);
  }
}


