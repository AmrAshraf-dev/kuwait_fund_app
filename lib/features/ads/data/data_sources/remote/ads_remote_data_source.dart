import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
 import '../../models/response/ads_response_model.dart';

abstract class AdsRemoteDataSource {
  Future<CustomResponseType<AdsResponseModel>> getAds(int pageNumber
       );
}

@Injectable(as: AdsRemoteDataSource)
class AdsDataSourceImpl implements AdsRemoteDataSource {
  AdsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<AdsResponseModel>> getAds(int pageNumber
       ) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.getAllAds,
        data: {
          "pageNumber": pageNumber,
          "pageSize": 10,
        },);

    if (result.success) {

      return right(AdsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
