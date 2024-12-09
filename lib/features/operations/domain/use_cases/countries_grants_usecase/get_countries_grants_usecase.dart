import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/country_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/repositories/operations_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';

@injectable
class GetCountriesGrantsUseCase
    implements UseCaseNoParam<BaseEntity<List<CountryGrantsEntity>>> {
  GetCountriesGrantsUseCase({required this.operationsRepository});

  final OperationsRepository operationsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<CountryGrantsEntity>>>> call() {
    return operationsRepository.getCountriesGrants();
  }
}
