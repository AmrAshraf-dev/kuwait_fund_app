import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/orders_request_model.dart';
import '../../models/response/orders_response_model.dart';

abstract class OrdersRemoteDataSource {
  Future<CustomResponseType<OrdersResponseModel>> getOrders(
      {required OrdersRequestModel ordersRequestModel});
}

@Injectable(as: OrdersRemoteDataSource)
class OrdersDataSourceImpl implements OrdersRemoteDataSource {
  OrdersDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<OrdersResponseModel>> getOrders(
      {required OrdersRequestModel ordersRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": ordersRequestModel.email ?? "",
      "lang": ordersRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(OrdersResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
