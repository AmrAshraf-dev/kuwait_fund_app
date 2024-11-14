import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/insurance_request_model.dart';
import '../../models/response/insurance_response_model.dart';

abstract class InsuranceRemoteDataSource {
  Future<CustomResponseType<InsuranceResponseModel>> getInsurance(
      {required InsuranceRequestModel insuranceRequestModel});
}

@Injectable(as: InsuranceRemoteDataSource)
class InsuranceDataSourceImpl implements InsuranceRemoteDataSource {
  InsuranceDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<InsuranceResponseModel>> getInsurance(
      {required InsuranceRequestModel insuranceRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": insuranceRequestModel.email ?? "",
      "lang": insuranceRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(InsuranceResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
