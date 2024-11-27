


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/stores_repository.dart';
import '../models/request/stores_request_model.dart';
import '../models/response/stores_response_model.dart';
import '../../../stores/data/data_sources/remote/stores_remote_data_source.dart';

@Injectable(as: StoresRepository)
class StoresRepositoryImp implements StoresRepository {
  StoresRepositoryImp({
    required this.storesRemoteDataSource,
  });

  final StoresRemoteDataSource storesRemoteDataSource;

  Future<CustomResponseType<BaseEntity<StoresModel>>> getStores(
      {required StoresRequestModel storesParams}) async {
    return await storesRemoteDataSource.getStores(
        storesRequestModel: storesParams);
  }
}


