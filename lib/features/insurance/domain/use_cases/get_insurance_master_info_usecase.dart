import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../../../error/failure.dart';

import '../../../shared/entity/base_entity.dart';
import '../entities/insurance_entity.dart';
import '../repositories/insurance_repository.dart';

@injectable
class GetInsuranceMasterInfoUseCase
    implements UseCaseNoParam<BaseEntity<InsuranceEntity>> {
  final InsuranceRepository repository;

  GetInsuranceMasterInfoUseCase(this.repository);

  @override
  Future<Either<Failure, BaseEntity<InsuranceEntity>>> call() async {
    return await repository.getInsuranceMasterInfo();
  }
}
