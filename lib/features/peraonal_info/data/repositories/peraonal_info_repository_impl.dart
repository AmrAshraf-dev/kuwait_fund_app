


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/peraonal_info_repository.dart';
import '../models/request/peraonal_info_request_model.dart';
import '../models/response/peraonal_info_response_model.dart';
import '../../../peraonal_info/data/data_sources/remote/peraonal_info_remote_data_source.dart';

@Injectable(as: PeraonalInfoRepository)
class PeraonalInfoRepositoryImp implements PeraonalInfoRepository {
  PeraonalInfoRepositoryImp({
    required this.peraonalInfoRemoteDataSource,
  });

  final PeraonalInfoRemoteDataSource peraonalInfoRemoteDataSource;

  Future<CustomResponseType<BaseEntity<PeraonalInfoModel>>> getPeraonalInfo(
      {required PeraonalInfoRequestModel peraonalInfoParams}) async {
    return await peraonalInfoRemoteDataSource.getPeraonalInfo(
        peraonalInfoRequestModel: peraonalInfoParams);
  }
}


