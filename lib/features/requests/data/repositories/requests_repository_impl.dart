import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/request_type_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/request_type_entity.dart';

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

  @override
 Future<CustomResponseType<BaseEntity<List<RequestTypeModel>>>> getRequestTypes() async {
    return await requestsRemoteDataSource.getRequestTypes();
  }
}
