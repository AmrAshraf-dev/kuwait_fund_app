import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/create_request_request_model.dart";
import "../entities/create_request_entity.dart";
import "../repositories/create_request_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetCreateRequestUseCase implements UseCase<BaseEntity<CreateRequestEntity>, CreateRequestRequestModel> {
    GetCreateRequestUseCase ({required this.createRequestRepository});

  final CreateRequestRepository createRequestRepository;


  @override
  Future<CustomResponseType<BaseEntity<CreateRequestEntity>>> call(
    CreateRequestRequestModel params,
  ) {
    
    
    return createRequestRepository.getCreateRequest(createRequestParams: params);
    
  }
}
