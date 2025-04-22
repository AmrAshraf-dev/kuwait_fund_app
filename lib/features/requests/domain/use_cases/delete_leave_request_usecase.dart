import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/delete_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/delete_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/repositories/requests_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';

@injectable
class GetDeleteLeaveUseCase
    implements
        UseCase<String, DeleteLeaveRequestModel> {
  GetDeleteLeaveUseCase({required this.requestsRepository});

  final RequestsRepository requestsRepository;

  @override
  Future<CustomResponseType<String>> call(
    DeleteLeaveRequestModel params,
  ) {
    return requestsRepository.createDeleteLeaveRequest(
        deleteLeaveRequestParams: params);
  }
}
