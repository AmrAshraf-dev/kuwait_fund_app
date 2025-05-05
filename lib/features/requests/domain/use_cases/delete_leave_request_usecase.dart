import 'package:injectable/injectable.dart';
import '../../data/models/request/delete_leave_request_model.dart';
import '../entities/delete_leave_entity.dart';
import '../repositories/requests_repository.dart';
import '../../../shared/entity/base_entity.dart';

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
