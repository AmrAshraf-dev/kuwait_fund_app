


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/request/profile_request_model.dart';
import '../models/response/profile_response_model.dart';
import '../../../profile/data/data_sources/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({
    required this.profileRemoteDataSource,
  });

  final ProfileRemoteDataSource profileRemoteDataSource;

  Future<CustomResponseType<BaseEntity<ProfileModel>>> getProfile(
      {required ProfileRequestModel profileParams}) async {
    return await profileRemoteDataSource.getProfile(
        profileRequestModel: profileParams);
  }
}


