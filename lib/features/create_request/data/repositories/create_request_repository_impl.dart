


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/create_request_repository.dart';
import '../models/request/create_request_request_model.dart';
import '../models/response/create_request_response_model.dart';
import '../../../create_request/data/data_sources/remote/create_request_remote_data_source.dart';

@Injectable(as: CreateRequestRepository)
class CreateRequestRepositoryImp implements CreateRequestRepository {
  CreateRequestRepositoryImp({
    required this.createRequestRemoteDataSource,
  });

  final CreateRequestRemoteDataSource createRequestRemoteDataSource;

  Future<CustomResponseType<BaseEntity<CreateRequestModel>>> getCreateRequest(
      {required CreateRequestRequestModel createRequestParams}) async {
    return await createRequestRemoteDataSource.getCreateRequest(
        createRequestRequestModel: createRequestParams);
  }
}


