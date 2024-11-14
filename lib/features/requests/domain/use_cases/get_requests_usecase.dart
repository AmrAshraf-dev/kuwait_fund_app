import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/requests_request_model.dart";
import "../entities/requests_entity.dart";
import "../repositories/requests_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetRequestsUseCase implements UseCase<BaseEntity<RequestsEntity>, RequestsRequestModel> {
    GetRequestsUseCase ({required this.requestsRepository});

  final RequestsRepository requestsRepository;


  @override
  Future<CustomResponseType<BaseEntity<RequestsEntity>>> call(
    RequestsRequestModel params,
  ) {
    
    
    return requestsRepository.getRequests(requestsParams: params);
    
  }
}
