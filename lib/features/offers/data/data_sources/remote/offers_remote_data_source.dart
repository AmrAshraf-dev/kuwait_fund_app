import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/offers_request_model.dart';
import '../../models/response/offers_response_model.dart';

abstract class OffersRemoteDataSource {
  Future<CustomResponseType<OffersResponseModel>> getOffers(
      {required OffersRequestModel offersRequestModel});
}

@Injectable(as: OffersRemoteDataSource)
class OffersDataSourceImpl implements OffersRemoteDataSource {
  OffersDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<OffersResponseModel>> getOffers(
      {required OffersRequestModel offersRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": offersRequestModel.email ?? "",
      "lang": offersRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(OffersResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
