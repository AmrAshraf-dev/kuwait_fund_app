import 'package:injectable/injectable.dart';
import '../../data/models/request/extend_leave_request_model.dart';
import '../entities/extend_leave_entity.dart';
import '../repositories/requests_repository.dart';
import '../../../shared/entity/base_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';

@injectable
class GetExtendLeaveUseCase
    implements
        UseCase<BaseEntity<CreateExtendLeaveEntity>, ExtendLeaveRequestModel> {
  GetExtendLeaveUseCase({required this.requestsRepository});

  final RequestsRepository requestsRepository;

  @override
  Future<CustomResponseType<BaseEntity<CreateExtendLeaveEntity>>> call(
    ExtendLeaveRequestModel params,
  ) {
    return requestsRepository.createExtendLeaveRequest(
        extendLeaveRequestParams: params);
  }
}
