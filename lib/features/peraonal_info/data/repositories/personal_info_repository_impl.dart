import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/personal_info_repository.dart';
import '../models/response/personal_info_response_model.dart';
import '../data_sources/remote/personal_info_remote_data_source.dart';

@Injectable(as: PersonalInfoRepository)
class PersonalInfoRepositoryImp implements PersonalInfoRepository {
  PersonalInfoRepositoryImp({
    required this.personalInfoRemoteDataSource,
  });

  final PersonalInfoRemoteDataSource personalInfoRemoteDataSource;

  Future<CustomResponseType<BaseEntity<PersonalInfoModel>>>
      getPersonalInfo() async {
    return await personalInfoRemoteDataSource.getPeraonalInfo();
  }
}
