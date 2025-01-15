import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_details_response_model.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/insurance_response_model.dart';

abstract class InsuranceRemoteDataSource {
  Future<CustomResponseType<InsuranceResponseModel>> getInsurancePrograms();
  Future<CustomResponseType<InsuranceDetailsResponseModel>>
      getInsuranceDetails();
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance();
}

@Injectable(as: InsuranceRemoteDataSource)
class InsuranceDataSourceImpl implements InsuranceRemoteDataSource {
  InsuranceDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<InsuranceResponseModel>>
      getInsurancePrograms() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
        path: ApiConstants.getInsurancePrograms,
        queryParams: {"userName": "TEST70"});

    if (result.success) {
      return right(InsuranceResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<InsuranceDetailsResponseModel>>
      getInsuranceDetails() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
        path: ApiConstants.getInsuranceDetails,
        queryParams: {"userName": "TEST70"});

    if (result.success) {
      return right(InsuranceDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance() async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.unsubscribeInsurance, data: {"userName": "TEST70"});

    if (result.success) {
      return right(BaseEntity<String>(data: result.response["data"]));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
