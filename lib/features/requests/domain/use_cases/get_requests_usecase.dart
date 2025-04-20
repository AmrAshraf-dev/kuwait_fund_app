import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../../data/models/request/requests_request_model.dart";
import "../entities/requests_entity.dart";
import "../repositories/requests_repository.dart";

@injectable
class GetRequestsUseCase
    implements UseCaseNoParam<BaseEntity<List<RequestsEntity>>> {
  GetRequestsUseCase({required this.requestsRepository});

  final RequestsRepository requestsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<RequestsEntity>>>> call(
   
  ) {
    return requestsRepository.getRequests();
  }
}
