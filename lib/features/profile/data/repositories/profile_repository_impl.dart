import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/address_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/experiences_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/family_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/qualifications_response_model.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/response/profile_response_model.dart';
import '../../../profile/data/data_sources/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({
    required this.profileRemoteDataSource,
  });

  final ProfileRemoteDataSource profileRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<ProfileModel>>> getProfile(
      /*{required ProfileRequestModel profileParams}*/) async {
    return await profileRemoteDataSource.getProfile(
        //profileRequestModel: profileParams
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
}
