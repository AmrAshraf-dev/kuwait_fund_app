import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/request/create_insurance_request_model.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_details_response_model.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_family_member_response_model.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_programs_response_model.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_response_model.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_subscriber_response_model.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';

abstract class InsuranceRemoteDataSource {
  Future<CustomResponseType<InsuranceProgramsResponseModel>>
      getInsurancePrograms();
  Future<CustomResponseType<InsuranceDetailsResponseModel>>
      getInsuranceMasterInfo();
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance();
  Future<CustomResponseType<InsuranceFamilyMemberResponseModel>>
      getFamilyMembers();
  Future<CustomResponseType<InsuranceResponseModel>> createInsuranceRequest(
      {required CreateInsuranceRequestModel insuranceRequestModel});
  Future<CustomResponseType<SubscriberResponseModel>> getSubscribers();
}

@Injectable(as: InsuranceRemoteDataSource)
class InsuranceDataSourceImpl implements InsuranceRemoteDataSource {
  InsuranceDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<InsuranceProgramsResponseModel>>
      getInsurancePrograms() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getInsurancePrograms,
    );

    if (result.success) {
      return right(InsuranceProgramsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<InsuranceDetailsResponseModel>>
      getInsuranceMasterInfo() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getInsuranceMasterInfo,
    );

    if (result.success) {
      return right(InsuranceDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance() async {
    ({dynamic response, bool success}) result = await networkHelper.post(
      path: ApiConstants.unsubscribeInsurance,
    );

    if (result.success) {
      return right(BaseEntity<String>(data: result.response["data"]));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<InsuranceFamilyMemberResponseModel>>
      getFamilyMembers() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getFamilyMembers,
    );

    if (result.success) {
      return right(
          InsuranceFamilyMemberResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<SubscriberResponseModel>> getSubscribers() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getSubscribers,
    );

    if (result.success) {
      return right(SubscriberResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<InsuranceResponseModel>> createInsuranceRequest(
      {required CreateInsuranceRequestModel insuranceRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
      path: ApiConstants.createInsuranceRequest,
      data: insuranceRequestModel.toJson(),
    );

    if (result.success) {
      return right(InsuranceResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
