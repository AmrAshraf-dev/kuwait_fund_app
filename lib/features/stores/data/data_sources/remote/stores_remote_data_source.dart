import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/stores_request_model.dart';
import '../../models/response/stores_response_model.dart';

abstract class StoresRemoteDataSource {
  Future<CustomResponseType<StoresResponseModel>> getStores(
      {required StoresRequestModel storesRequestModel});
}

@Injectable(as: StoresRemoteDataSource)
class StoresDataSourceImpl implements StoresRemoteDataSource {
  StoresDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<StoresResponseModel>> getStores(
      {required StoresRequestModel storesRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": storesRequestModel.email ?? "",
      "lang": storesRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(StoresResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
