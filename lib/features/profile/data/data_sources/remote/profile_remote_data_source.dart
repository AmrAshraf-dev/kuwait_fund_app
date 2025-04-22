import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/address_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/experiences_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/family_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/qualifications_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/profile_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<CustomResponseType<ProfileResponseModel>> getProfile(
      /*{required ProfileRequestModel profileRequestModel}*/);

  Future<CustomResponseType<AddressResponseModel>> getAddress();

  Future<CustomResponseType<FamilyResponseModel>> getFamily();
  Future<CustomResponseType<QualificationsResponseModel>> getQualifications();
  Future<CustomResponseType<ExperiencesResponseModel>> getExperiences();
  //
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileDataSourceImpl implements ProfileRemoteDataSource {
  ProfileDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<ProfileResponseModel>> getProfile(
      /*{ProfileRequestModel? profileRequestModel}*/) async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getProfileInfo);

    if (result.success) {
      return right(ProfileResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<AddressResponseModel>> getAddress() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getAddressDetails);

    if (result.success) {
      return right(AddressResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<FamilyResponseModel>> getFamily() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getFamilyData);

    if (result.success) {
      return right(FamilyResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<QualificationsResponseModel>>
      getQualifications() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getQualificationsData);

    if (result.success) {
      return right(QualificationsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ExperiencesResponseModel>> getExperiences() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getExperiencesData);

    if (result.success) {
      return right(ExperiencesResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
