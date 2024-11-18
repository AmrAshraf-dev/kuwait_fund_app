import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/peraonal_info_request_model.dart';
import '../../models/response/peraonal_info_response_model.dart';

abstract class PeraonalInfoRemoteDataSource {
  Future<CustomResponseType<PeraonalInfoResponseModel>> getPeraonalInfo(
      {required PeraonalInfoRequestModel peraonalInfoRequestModel});
}

@Injectable(as: PeraonalInfoRemoteDataSource)
class PeraonalInfoDataSourceImpl implements PeraonalInfoRemoteDataSource {
  PeraonalInfoDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<PeraonalInfoResponseModel>> getPeraonalInfo(
      {required PeraonalInfoRequestModel peraonalInfoRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": peraonalInfoRequestModel.email ?? "",
      "lang": peraonalInfoRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(PeraonalInfoResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
