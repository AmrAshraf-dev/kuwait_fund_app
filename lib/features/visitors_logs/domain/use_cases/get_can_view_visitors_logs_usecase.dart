import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
  import 'package:kf_ess_mobile_app/features/visitors_logs/domain/repositories/visitors_logs_repository.dart';

@injectable
class GetCanViewVisitorsLogsUsecase
    implements
        UseCaseNoParam<bool>
              {
  GetCanViewVisitorsLogsUsecase({required this.visitorsLogsRepository});

  final VisitorsLogsRepository visitorsLogsRepository;

  @override
  Future<CustomResponseType<bool>> call(
    
  ) {
    return visitorsLogsRepository.getCanViewVisitorsLogs(
        );
  }
}
