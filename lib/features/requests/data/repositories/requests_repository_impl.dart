import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../requests/data/data_sources/remote/requests_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/requests_repository.dart';
import '../models/request/requests_request_model.dart';
import '../models/response/requests_response_model.dart';

@Injectable(as: RequestsRepository)
class RequestsRepositoryImp implements RequestsRepository {
  RequestsRepositoryImp({
    required this.requestsRemoteDataSource,
  });

  final RequestsRemoteDataSource requestsRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<RequestsModel>>>> getRequests(
      {required RequestsRequestModel requestsParams}) async {
    return await requestsRemoteDataSource.getRequests(
        requestsRequestModel: requestsParams);
  }
}
