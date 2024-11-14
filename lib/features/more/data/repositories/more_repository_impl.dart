


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/more_repository.dart';
import '../models/request/more_request_model.dart';
import '../models/response/more_response_model.dart';
import '../../../more/data/data_sources/remote/more_remote_data_source.dart';

@Injectable(as: MoreRepository)
class MoreRepositoryImp implements MoreRepository {
  MoreRepositoryImp({
    required this.moreRemoteDataSource,
  });

  final MoreRemoteDataSource moreRemoteDataSource;

  Future<CustomResponseType<BaseEntity<MoreModel>>> getMore(
      {required MoreRequestModel moreParams}) async {
    return await moreRemoteDataSource.getMore(
        moreRequestModel: moreParams);
  }
}


