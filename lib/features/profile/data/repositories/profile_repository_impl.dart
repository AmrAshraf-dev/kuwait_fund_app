import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/child_entity.dart';

import '../../../../core/network/base_handling.dart';
import '../../../profile/data/data_sources/remote/profile_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/entities/spouse_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/request/child_request_model.dart';
import '../models/request/edit_child_request_model.dart';
import '../models/request/edit_spouse_request_model.dart';
import '../models/request/profile_request_model.dart';
import '../models/request/spouse_request_model.dart';
import '../models/response/address_response_model.dart';
import '../models/response/child_response_model.dart';
import '../models/response/experiences_response_model.dart';
import '../models/response/family_response_model.dart';
import '../models/response/lookup_response_model.dart';
import '../models/response/main_profile_response_model.dart';
import '../models/response/qualifications_response_model.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({
    required this.profileRemoteDataSource,
  });

  final ProfileRemoteDataSource profileRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<MainProfileModel>>> getProfile(
    ) async {
    return await profileRemoteDataSource.getProfile(
    
        );
  }

  @override
  Future<CustomResponseType<BaseEntity<AddressModel>>> getAddress() async {
    return await profileRemoteDataSource.getAddress();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<FamilyModel>>>> getFamily() async {
    return await profileRemoteDataSource.getFamily();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<QualificationsModel>>>>
      getQualifications() async {
    return await profileRemoteDataSource.getQualifications();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<ExperiencesModel>>>>
      getExperiences() async {
    return await profileRemoteDataSource.getExperiences();
  }

  @override
  Future<CustomResponseType<BaseEntity<SpouseEntity>>> getSpouse(
      {required SpouseRequestModel spouseParams}) async {
    return await profileRemoteDataSource.getSpouse(
        spouseRequestModel: spouseParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<ChildEntity>>> getChild(
      {required ChildRequestModel childParams}) async {
    return await profileRemoteDataSource.getChild(
        childRequestModel: childParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> editProfile(
      {required ProfileRequestModel profileRequestModel}) async {
    return await profileRemoteDataSource.editProfile(
        profileRequestModel: profileRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> editSpouse(
      {required EditSpouseRequestModel editSpouseRequestModel}) async {
    return await profileRemoteDataSource.editSpouse(
        editSpouseRequestModel: editSpouseRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> editChild(
      {required EditChildRequestModel editChildRequestModel}) async {
    return await profileRemoteDataSource.editChild(
        editChildRequestModel: editChildRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<List<LookupModel>>>> getLookup(String lookupPath) async {
    return profileRemoteDataSource.getLookup(lookupPath);
  }
}
