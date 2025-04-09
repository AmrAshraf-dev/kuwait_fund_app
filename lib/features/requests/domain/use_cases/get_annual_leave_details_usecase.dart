import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/repositories/requests_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

@injectable
class GetAnnualLeaveDetailsHistoryUseCase
    implements
        UseCase<BaseEntity<List<AnnualLeaveDetailsEntity>>,
            AnnualLeaveDetailsRequestModel> {
  GetAnnualLeaveDetailsHistoryUseCase({required this.requestsRepository});

  final RequestsRepository requestsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<AnnualLeaveDetailsEntity>>>> call(
    AnnualLeaveDetailsRequestModel params,
  ) {
    return requestsRepository.getAnnualLeaveDetailsHistoryList(
        annualLeaveDetailsParams: params);
  }
}
