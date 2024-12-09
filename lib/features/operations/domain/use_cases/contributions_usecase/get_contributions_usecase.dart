import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/contribution_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/repositories/operations_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';

@injectable
class GetContributionsUseCase
    implements UseCaseNoParam<BaseEntity<List<ContributionEntity>>> {
  GetContributionsUseCase({required this.operationsRepository});

  final OperationsRepository operationsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<ContributionEntity>>>> call() {
    return operationsRepository.getContributions();
  }
}
