import 'package:injectable/injectable.dart';
import '../../entities/contribution_entity.dart';
import '../../repositories/operations_repository.dart';

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
