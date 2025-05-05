import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../../../core/network/base_handling.dart';
import '../repositories/visitors_logs_repository.dart';

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
