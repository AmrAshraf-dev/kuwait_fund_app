import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_info_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/repositories/requests_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

@injectable
class GetAnnualLeaveInfoUseCase
    implements
        UseCase<BaseEntity<AnnualLeaveInfoEntity>,
            AnnualLeaveInfoRequestModel> {
  GetAnnualLeaveInfoUseCase({required this.requestsRepository});

  final RequestsRepository requestsRepository;

  @override
  Future<CustomResponseType<BaseEntity<AnnualLeaveInfoEntity>>> call(
    AnnualLeaveInfoRequestModel params,
  ) {
    return requestsRepository.getAnnualLeaveInfo(annualLeaveInfoParams: params);
  }
}
