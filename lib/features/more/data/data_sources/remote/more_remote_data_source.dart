import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/more_request_model.dart';
import '../../models/response/more_response_model.dart';

abstract class MoreRemoteDataSource {
  Future<CustomResponseType<MoreResponseModel>> getMore(
      {required MoreRequestModel moreRequestModel});
}

@Injectable(as: MoreRemoteDataSource)
class MoreDataSourceImpl implements MoreRemoteDataSource {
  MoreDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<MoreResponseModel>> getMore(
      {required MoreRequestModel moreRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": moreRequestModel.email ?? "",
      "lang": moreRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(MoreResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
