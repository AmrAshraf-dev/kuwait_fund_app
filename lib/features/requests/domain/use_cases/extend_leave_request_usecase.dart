import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/extend_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/repositories/requests_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

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
